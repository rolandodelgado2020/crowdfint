<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

 /**
     * Los atributos que son asignables en masa.
     *
     * @var array $fillable
     */
    
class Origenfondos extends Model
{
         protected $fillable = [
             'id_origen_fondos',  
            'nombre',
            'descripcion'      
      ];
   
       
}
