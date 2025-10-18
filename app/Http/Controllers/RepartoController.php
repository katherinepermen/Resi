<?php

namespace App\Http\Controllers;

use App\Models\Prestamo;
use App\Models\Usuario;
use App\Models\Ejidatario;
use App\Models\Utilidad;
use App\Models\Reparto; // Importamos el modelo Reparto
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Exception;

class RepartoController extends Controller
{
    /**
     * Muestra la lista de préstamos que han sido descontados por el Primer Reparto.
     */
    public function index()
    {
        // Obtener el monto de la utilidad del catálogo (Reparto 1)
        $utilidad = Utilidad::where('tipo_reparto', 'primer_reparto')->first();
        
        // Consulta para obtener préstamos que tienen un descuento registrado en el Reparto 1
        $prestamos = Prestamo::join('ejidatario', 'prestamo.id_ejidatario', '=', 'ejidatario.id_ejidatario')
            ->join('usuario', 'ejidatario.id_usuario', '=', 'usuario.id_usuario')
            // INNER JOIN para filtrar SOLO los préstamos que tienen un registro en reparto_utilidad con num_rep = 1
            ->join('reparto_utilidad AS ru', function($join) {
                $join->on('prestamo.id_prestamo', '=', 'ru.id_prestamo')
                     ->where('ru.num_rep', 1);
            })
            ->select(
                'prestamo.id_prestamo',
                'prestamo.cantidad',
                'prestamo.motivo',
                'prestamo.fecha',
                'usuario.nombre',
                'usuario.apellido_paterno',
                'usuario.apellido_materno',
                'ru.cantidad AS monto_descontado',
                'ru.id_reparto_uti'
            )
            ->get();

        return view('Repartos.reparto1', compact('prestamos', 'utilidad'));
    }

    /**
     * Busca un ejidatario por nombre para el modal de préstamo.
     */
    public function buscarEjidatario(Request $request)
    {
        $query = $request->input('q');
        
        $usuario = Usuario::where(DB::raw("CONCAT(nombre, ' ', apellido_paterno, ' ', apellido_materno)"), 'LIKE', "%{$query}%")
            ->orWhere('nombre', 'LIKE', "%{$query}%")
            ->orWhere('apellido_paterno', 'LIKE', "%{$query}%")
            ->orWhere('apellido_materno', 'LIKE', "%{$query}%")
            ->first();

        if ($usuario) {
            $ejidatario = Ejidatario::where('id_usuario', $usuario->id_usuario)->first();

            if ($ejidatario) {
                $utilidad = Utilidad::where('tipo_reparto', 'primer_reparto')->first();
                $disponible = $utilidad ? $utilidad->monto : 0;
                
                return response()->json([
                    'id' => $ejidatario->id_ejidatario,
                    'nombre_completo' => trim("{$usuario->nombre} {$usuario->apellido_paterno} {$usuario->apellido_materno}"),
                    'disponible' => $disponible
                ]);
            }
        }

        return response()->json(['id' => null], 404);
    }
    
    /**
     * Guarda un nuevo préstamo y automáticamente asigna el descuento del Primer Reparto.
     */
    public function store(Request $request)
    {
        // 1. Validar los datos del formulario
        $request->validate([
            'id_ejidatario' => 'required|integer|exists:ejidatario,id_ejidatario',
            'descripcion' => 'required|string|max:250',
            'cantidad' => 'required|numeric|min:0.01',
        ]);
        
        try {
            // 2. CREAR Y GUARDAR EL PRÉSTAMO
            $prestamo = new Prestamo();
            $prestamo->id_ejidatario = $request->id_ejidatario;
            $prestamo->cantidad = $request->cantidad;
            $prestamo->motivo = $request->descripcion;
            $prestamo->fecha = now();
            $prestamo->fecha_creo = now();
            $prestamo->id_creo = Auth::id() ?? 1;
            $prestamo->utilidad = 0; // 0 significa no asociado a ninguna utilidad específica por ID
            
            $prestamo->fecha_eliminado = null;
            $prestamo->fecha_modificado = null;
            $prestamo->id_elimino = null;
            $prestamo->id_modifico = null;
            
            $prestamo->save(); // El ID del préstamo ahora está disponible: $prestamo->id_prestamo
            
            // 3. ASIGNAR EL DESCUENTO DEL PRIMER REPARTO
            
            // Asumimos que quieres asignar la cantidad total del préstamo al descuento.
            $descuento = new Reparto();
            $descuento->id_ejidatario = $prestamo->id_ejidatario;
            $descuento->id_prestamo = $prestamo->id_prestamo; // Vinculamos el nuevo préstamo
            $descuento->cantidad = $prestamo->cantidad;      // Monto a descontar (el total del préstamo)
            $descuento->estado = 'aplicado';
            $descuento->fecha_rep = now();
            $descuento->num_rep = 1; // 1 = Primer Reparto (Este valor es clave para el filtro index())
            $descuento->descripcion = 'Descuento automático por solicitud de préstamo';
            $descuento->fecha_creo = now();
            $descuento->id_creo = Auth::id() ?? 1;

            $descuento->save();

            // 4. Redirigir con mensaje de éxito
            return redirect()->route('reparto1.index')->with('success', 'Préstamo y descuento de reparto asignado con éxito.');

        } catch (Exception $e) {
            // Si falla el guardado, redirigimos mostrando el error
            return redirect()->back()->withInput()->withErrors(['db_error' => 'Error al guardar el préstamo y el descuento: ' . $e->getMessage()]);
        }
    }

    /**
     * Muestra el formulario para editar el reparto.
     */
    public function edit($id)
    {
        $reparto = Reparto::with(['ejidatario.usuario', 'prestamo'])->find($id);
        
        if (!$reparto) {
            return response()->json(['error' => 'Reparto no encontrado'], 404);
        }

        return response()->json([
            'id' => $reparto->id_reparto_uti,
            'ejidatario' => $reparto->ejidatario->usuario->nombre . ' ' . 
                            $reparto->ejidatario->usuario->apellido_paterno . ' ' . 
                            $reparto->ejidatario->usuario->apellido_materno,
            'cantidad' => $reparto->cantidad,
            'descripcion' => $reparto->descripcion,
            'id_prestamo' => $reparto->id_prestamo
        ]);
    }

    /**
     * Actualiza el reparto especificado.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'cantidad' => 'required|numeric|min:0.01',
            'descripcion' => 'required|string'
        ]);

        try {
            DB::beginTransaction();
            
            $reparto = Reparto::findOrFail($id);
            $reparto->cantidad = $request->cantidad;
            $reparto->descripcion = $request->descripcion;
            $reparto->fecha_modificado = now();
            $reparto->id_modifico = Auth::id() ?? 1;
            $reparto->save();
            
            // También actualizamos el préstamo asociado
            if ($reparto->id_prestamo) {
                $prestamo = Prestamo::find($reparto->id_prestamo);
                if ($prestamo) {
                    $prestamo->cantidad = $request->cantidad;
                    $prestamo->motivo = $request->descripcion;
                    $prestamo->fecha_modificado = now();
                    $prestamo->id_modifico = Auth::id() ?? 1;
                    $prestamo->save();
                }
            }

            DB::commit();
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Elimina el reparto especificado.
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();
            
            $reparto = Reparto::findOrFail($id);
            
            // También eliminamos el préstamo asociado
            if ($reparto->id_prestamo) {
                $prestamo = Prestamo::find($reparto->id_prestamo);
                if ($prestamo) {
                    $prestamo->fecha_eliminado = now();
                    $prestamo->id_elimino = Auth::id() ?? 1;
                    $prestamo->save();
                }
            }
            
            $reparto->delete();
            
            DB::commit();
            return redirect()->route('reparto1.index')
                            ->with('success', 'Reparto eliminado correctamente');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()
                            ->with('error', 'Error al eliminar el reparto: ' . $e->getMessage());
        }
    }
}
