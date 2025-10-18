<?php

namespace App\Http\Controllers;

use App\Models\Utilidad;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class UtilidadController extends Controller
{
    public function index()
    {
       $totalMonto = Utilidad::sum('monto');
       return view('monto.monto', compact('totalMonto'));
    }

    public function guardar(request $request)
    {
        // ... tu método para guardar nuevos registros se queda como está ...
    }

    // --- NUEVOS MÉTODOS ---

    /**
     * MÉTODO 1: Para obtener los datos y devolverlos como JSON.
     * Este método será llamado por JavaScript.
     */
    public function getData($tipo)
    {
        // Buscamos en la tabla 'utilidades' donde la columna 'tipo_reparto' coincida.
        $utilidad = Utilidad::where('tipo_reparto', $tipo)->first();

        if ($utilidad) {
            return response()->json($utilidad);
        }
        // Si no se encuentra, devolvemos un error.
        return response()->json(['message' => 'No se encontraron datos para este tipo de reparto'], 404);
    }

    /**
     * MÉTODO 2: Para actualizar un registro existente.
     * Este método recibirá los datos del formulario cuando edites.
     */
    public function update(Request $request, $id)
    {
        // Validar los datos del formulario
        $validatedData = $request->validate([
            'monto' => 'required|numeric',
            'anio' => 'required|numeric',
            'tipo_reparto' => 'required|string',
            'fecha_registro' => 'required|date',
        ]);

        // Buscar el registro existente por su ID ('id_utilidad')
        $utilidad = Utilidad::findOrFail($id);

        // Actualizar los datos del registro encontrado
        $utilidad->monto = $validatedData['monto'];
        $utilidad->anio = $validatedData['anio'];
        $utilidad->tipo_reparto = $validatedData['tipo_reparto'];
        $utilidad->fecha_registro = $validatedData['fecha_registro'];
        // Opcional: registrar quién hizo el último cambio
        $utilidad->id_user = Auth::id(); 
        
        $utilidad->save(); // Guardar los cambios

        // Redirigir de vuelta con un mensaje de éxito
        return redirect()->back()->with('success', 'Monto actualizado correctamente.');
    }
}