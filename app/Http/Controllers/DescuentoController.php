<?php

namespace App\Http\Controllers;

use App\Models\descuento;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class DescuentoController extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function index()
    {
       
       $totalMonto = Utilidad::sum('monto');


       return view('monto.monto', compact('totalMonto'));
    }
  

    public function guardarDescuento(Request $request)
    {
        $validatedData = $request->validate([
            'monto' => 'required|numeric',
            'anio' => 'required|numeric',
            'tipo' => 'required|string',
        ]);

        // Buscar el descuento por tipo y año
        $descuento = \App\Models\descuento::where('tipo', $validatedData['tipo'])
            ->where('anio', $validatedData['anio'])
            ->first();

        if ($descuento) {
            // Solo actualiza el monto
            $descuento->monto = $validatedData['monto'];
            $descuento->save();
            return redirect()->back()->with('success', 'Monto actualizado correctamente.');
        } else {
            return redirect()->back()->with('error', 'No se encontró el descuento para editar.');
        }
    }

    public function getMonto($tipo)
    {
        $descuento = \App\Models\descuento::where('tipo', $tipo)->first();

        return response()->json([
            'monto' => $descuento ? $descuento->monto : 0,
            'anio' => $descuento ? $descuento->anio : '',
            'fecha_registro' => $descuento ? $descuento->fecha_registro : ''
        ]);
    }
}