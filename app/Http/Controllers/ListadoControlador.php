<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ListadoControlador extends Controller
{
    public function index()
    {
        return view('monto.listado');
    }
}
