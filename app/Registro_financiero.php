<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

 /**
     * Los atributos que son asignables en masa.
     *
     * @var array $fillable
     */
    
class Registro_financiero extends Model
{
         protected $fillable = [
            'apellidoynombre',
            'id_origen_fondos',
            'id_users',
            'id_pais',
            'correo_paypal' ,
            'politicamente_expuesta',           
            'cuenta_bancaria_eeuu',
            'fecha_registro_financiero'    
      ];
   
       
}
