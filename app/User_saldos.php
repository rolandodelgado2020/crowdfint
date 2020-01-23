<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

 /**
     * Los atributos que son asignables en masa.
     *
     * @var array $fillable
     */
    
class User_saldos extends Model
{
         protected $fillable = [             
                'id_user',	
                'fecha_saldo',	
                'saldo_dolar',	
                'disponible',
                'saldo_invertido' 
         ];   
          
}