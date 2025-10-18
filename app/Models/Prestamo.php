<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Prestamo extends Model
{
    protected $table = 'prestamo';
    protected $primaryKey = 'id_prestamo';
    public $timestamps = false;

    protected $fillable = [
        'id_ejidatario',
        'cantidad',
        'motivo',
        'fecha',
        'fecha_eliminado',
        'fecha_modificado',
        'fecha_creo',
        'id_elimino',
        'id_modifico',
        'id_creo',
        'utilidad'
    ];

    protected $dates = [
        'fecha',
        'fecha_eliminado',
        'fecha_modificado',
        'fecha_creo'
    ];

    public function ejidatario()
    {
        return $this->belongsTo(Usuario::class, 'id_ejidatario', 'id_usuario');
    }
}