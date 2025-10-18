<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\http\Controllers\UtilidadController;

class  Utilidad extends Model
{
   use HasFactory;
    protected $table = 'utilidades';  // Cambiado de 'utilidad' a 'utilidades'
    protected $primaryKey = 'id_utilidad';
    protected $fillable = [
        'monto',
        'fecha'
    ];
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_user');
    }
    public $timestamps = false;

    // Relación con UtilidadEjidatario
    public function utilidadEjidatario()
    {
        return $this->hasMany(UtilidadEjidatario::class, 'id_utilidad');
    }
}
