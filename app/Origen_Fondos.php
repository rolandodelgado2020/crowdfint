<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

 /**
     * Los atributos que son asignables en masa.
     *
     * @var array $fillable
     */
    
class Origen_Fondos extends Model
{
         protected $fillable = [
            'nombre',
            'descripcion'      
      ];
   
       
}
