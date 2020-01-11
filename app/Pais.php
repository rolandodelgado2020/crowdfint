<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pais extends Model
{
    /**
     * Los atributos que son asignables en masa.
     *
     * @var array $fillable
     */
    protected $fillable = [
        'id',
        'nombre',
        'iso'
    ];

    /**
     * Las publicaciones que pertenecen a la etiqueta.
     */
    
}
