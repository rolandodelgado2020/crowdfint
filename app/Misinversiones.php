<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

 /**
     * Los atributos que son asignables en masa.
     *misinversiones
     * @var array $fillable
     */
    
class Misinversiones extends Model
{
         protected $fillable = [  
              'title',
              'id_user',
              'id_post',
              'dinero_invertido',
              'fecha_inversion' ,        
              'id_user'
                
         ];   
          
}