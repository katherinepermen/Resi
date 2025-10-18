<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // Utilidades
        $finiquito = \App\Models\Utilidad::where('tipo_reparto', 'reparto_finiquito')->value('monto') ?? 0;
        $primerReparto = \App\Models\Utilidad::where('tipo_reparto', 'primer_reparto')->value('monto') ?? 0;
        $segundoReparto = \App\Models\Utilidad::where('tipo_reparto', 'segundo_reparto')->value('monto') ?? 0;
        $finiquitoUtilidades = \App\Models\Utilidad::where('tipo_reparto', 'finiquito_utilidades')->value('monto') ?? 0;

        // Descuentos (asegúrate que los nombres coincidan con tu base de datos)
        $descuentoSaneamiento = \App\Models\descuento::where('tipo', 'Descuento faenas de saneamient')->value('monto') ?? 0;
        $descuentoAprovechamiento = \App\Models\descuento::where('tipo', 'Descuento faenas de aprovecham')->value('monto') ?? 0;
        $descuentoAsambleas = \App\Models\descuento::where('tipo', 'Descuento asambleas')->value('monto') ?? 0;

        $finiquitoUtilidad = $finiquito;

        return view('home', compact(
            'finiquito', 'primerReparto', 'segundoReparto', 'finiquitoUtilidades',
            'descuentoSaneamiento', 'descuentoAprovechamiento', 'descuentoAsambleas',
            'finiquitoUtilidad'
        ));
    }
    public function descuentos()
    {
        $descuentoSaneamiento = \App\Models\descuento::where('tipo', 'Descuento faenas de saneamient')->value('monto') ?? 0;
        $descuentoAprovechamiento = \App\Models\descuento::where('tipo', 'Descuento faenas de aprovecham')->value('monto') ?? 0;
        $descuentoAsambleas = \App\Models\descuento::where('tipo', 'Descuento asambleas')->value('monto') ?? 0;

        return view('monto.descuento', compact(
            'descuentoSaneamiento',
            'descuentoAprovechamiento',
            'descuentoAsambleas'
        ));
    }
}
