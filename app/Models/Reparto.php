<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reparto extends Model
{
    protected $table = 'reparto_utilidad';
    protected $primaryKey = 'id_reparto_uti';
    public $timestamps = false;

    protected $fillable = [
        'cantidad',
        'estado',
        'fecha_rep',
        'num_rep',
        'id_ejidatario',
        'descripcion', // Asegúrate que esta exista si la usas
        'id_prestamo' // <--- ESTE CAMPO ES VITAL
    ];

    // Relación con Ejidatario
    public function ejidatario()
    {
        return $this->belongsTo(Ejidatario::class, 'id_ejidatario');
    }

    // Relación con Utilidad
    public function utilidad()
    {
        return $this->belongsTo(Utilidad::class, 'id_utilidad');
    }
}