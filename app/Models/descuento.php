<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\User;
use App\http\Controllers\descuentoController;

class descuento extends Model
{
use HasFactory;
    protected $table = 'catalogo_multa'; 
    protected $primaryKey = 'id_multa_c';
    protected $fillable = [
        'monto',
        'anio',
        'tipo',
        'fecha_registro',
        'id_user',
        'fecha_creo',
        'id_creo',
    ];
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'id_user');
    }
    public $timestamps = false;
    
}
