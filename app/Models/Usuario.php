<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $table = 'usuario';
    protected $primaryKey = 'id_usuario';
    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'apellido_paterno',
        'apellido_materno',
        'estado'
    ];

    // Relación con Prestamo
    public function prestamos()
    {
        return $this->hasMany(Prestamo::class, 'id_ejidatario', 'id_usuario');
    }
}