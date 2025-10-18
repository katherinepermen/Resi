<?php

namespace App\Http\Controllers;

use App\Models\descuento;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function index()
    {
        $finiquitoSaneamiento = \App\Models\Utilidad::where('tipo_reparto', 'reparto_finiquito_saneamiento')->value('monto') ?? 0;
        $finiquitoUtilidad = \App\Models\Utilidad::where('tipo_reparto', 'reparto_finiquito_utilidad')->value('monto') ?? 0;
        $finiquitoGeneral = \App\Models\Utilidad::where('tipo_reparto', 'finiquito_utilidad')->value('monto') ?? 0;

        return view('monto.monto', compact(
            'finiquitoSaneamiento',
            'finiquitoUtilidad',
            'finiquitoGeneral'
        ));
    }
  
    public function guardar(Request $request)
    {
        // VALIDAR LOS DATOS DEL FORMULARIO
        $validatedData = $request->validate([
            'monto' => 'required|numeric',
            'anio' => 'required|numeric',
            'tipo' => 'required|string',
            'fecha_registro' => 'required|date',
        ]);

        // crear un nuevo registro en la tabla 'catalogo_multa'
        $descuento = new descuento();
        $descuento->monto = $validatedData['monto'];
        $descuento->anio = $validatedData['anio'];
        $descuento->tipo = $validatedData['tipo'];
        $descuento->fecha_registro = $validatedData['fecha_registro'];
        $descuento->id_user = Auth::id();
        $descuento->save();  $descuento->save();

        return redirect()->route('home')->with('success', 'Datos guardados correctamente.');        return redirect()->route('home')->with('success', 'Datos guardados correctamente.');
         
    }

      
            



}