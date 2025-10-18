<?php

use App\Http\Controllers\UtilidadController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\DescuentoController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\RepartoController;
use App\Http\Controllers\ListadoControlador;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// --- RUTAS PARA EL MÓDULO DE MONTO/UTILIDAD ---

Route::get('/monto', [UtilidadController::class, 'index'])->name('monto')
    ->middleware('auth');
Route::post('/monto', [UtilidadController::class, 'guardar'])->name('guardar-monto');
Route::get('/utilidad/get-data/{tipo}', [UtilidadController::class, 'getData'])->name('utilidad.getData');
Route::put('/utilidad/update/{id}', [UtilidadController::class, 'update'])->name('utilidad.update');

// --- OTRAS RUTAS DE TU APLICACIÓN ---

// Rutas para descuentos faenas y asambleas
Route::get('/descuento', function () {
    return view('monto.descuento');
})->name('descuento');
Route::post('/descuento', [DescuentoController::class, 'guardarDescuento'])->name('guardar-descuento');
Route::get('/descuento/get-monto/{tipo}', [App\Http\Controllers\DescuentoController::class, 'getMonto']);

// Rutas de autenticación de Laravel
Auth::routes();

// Rutas de tu aplicación
Route::get('/home', [HomeController::class, 'index'])->name('home')->middleware('auth');
Route::get('/', function () {
    return view('welcome');
});
// Nota: Asegúrate de que ListadoControlador exista
Route::get('/listado', [ListadoControlador::class, 'index'])->name('listado');

// --- RUTAS PARA REPARTO (Primer Reparto) ---
// La ruta index se llamaba 'primer-reparto' antes. Ahora se llama 'reparto1.index'
// Y el POST se llama 'reparto1.store'
Route::get('/primer-reparto', [RepartoController::class, 'index'])->name('reparto1.index'); 
Route::post('/primer-reparto', [RepartoController::class, 'store'])->name('reparto1.store');
Route::get('/primer-reparto/{id}', [RepartoController::class, 'show'])->name('reparto1.show');
Route::get('/reparto1/{id}/edit', [RepartoController::class, 'edit'])->name('reparto1.edit');
Route::put('/reparto1/{id}', [RepartoController::class, 'update'])->name('reparto1.update');
Route::delete('/reparto1/{id}', [RepartoController::class, 'destroy'])->name('reparto1.destroy');

// Ruta para la búsqueda AJAX de ejidatarios en el modal
Route::get('/buscar-ejidatario', [RepartoController::class, 'buscarEjidatario'])->name('buscar.ejidatario');
