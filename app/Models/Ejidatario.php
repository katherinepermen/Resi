<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ejidatario extends Model
{
    protected $table = 'ejidatario';
    protected $primaryKey = 'id_ejidatario';
    public $timestamps = false;

    protected $fillable = [
        'num_ejidatario',
        'nombre',
        'apellido_paterno',
        'apellido_materno',
        'estado'
    ];

    // Relación con Reparto
    public function repartos()
    {
        return $this->hasMany(Reparto::class, 'id_ejidatario');
    }

    // Relación con UtilidadEjidatario
    public function utilidadEjidatario()
    {
        return $this->hasMany(UtilidadEjidatario::class, 'id_ejidatario');
    }
}