<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateRegistroFinancieroFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return TRUE;
    }

    /**
     * @todo: Refactor rules to combine create and update requests.
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [  
            'apellidoynombre'         => 'required|string|max:256',
            'correo_paypal'      => 'required|string|max:250',
            'documento'          => 'required|string|unique:posts,max:100',
            'cuenta_bancaria_eeuu'          => 'required',
            'fecha_nacimiento'       => 'required',
            'politicamente_expuesta'         => 'required',
            'id_pais'    => 'required',
            
        ];
    }
}
