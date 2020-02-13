@extends('layouts.dashboard')

@section('page_title', 'Completar Registro')

@section('module_title', 'Completar Registro')

@section('content')
@can('posts.registro_financiero')


  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">
    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="section-block" id="basicform">
                <h3 class="section-title">Usuario: {{ $user->name }}</h3>
                <p></p>
            </div>
            <div class="card">
                <h5 class="card-header">Datos Personales</h5>
                <div class="card-body">
                <form method="POST" action="{{ route('posts.registro_financiero_guardar') }}">
                        @csrf
                        @method('put')
                        <div class="form-group">
                            <label for="apellidoynombre" class="col-form-label">Apellido y Nombre</label>
                            <input id="apellidoynombre" name="apellidoynombre" type="text" class="form-control {{ $errors->has('apellidoynombre') ? ' is-invalid' : '' }}" value="">

                            @if ($errors->has('apellidoynombre'))
                            <div class="invalid-feedback">
                                <strong>{{ $errors->first('apellidoynombre') }}</strong>
                            </div>
                            @endif
                        </div>
                        <div class="form-group">
                           <label for="documento" class="col-form-label">Documento</label>
                           <input id="documento" name="documento" type="text" class="form-control {{ $errors->has('documento') ? ' is-invalid' : '' }}" value="">
                            @if ($errors->has('documento'))
                                <div class="invalid-feedback">
                                    <strong>{{ $errors->first('documento') }}</strong>
                                </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <div >
                            <label for="fecha_nacimiento" class="col-form-label">Fecha de Nacimiento</label>
                             <input class="date form-control" type="text" class="form-control {{ $errors->has('fecha_nacimiento') ? ' is-invalid' : '' }}">
                             @if ($errors->has('fecha_nacimiento'))
                                <div class="invalid-feedback">
                                    <strong>{{ $errors->first('fecha_nacimiento') }}</strong>
                                </div>
                            @endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="id_pais" class="col-form-label">Pais</label>
                         
                                <select class="form-control" name="id_pais" id="id_pais">
                                    @foreach ($paises as $pais)
                                    <option value="{{$pais->id}}">{{$pais->nombre}}</option>
                                     @endforeach
                                </select>
                        
                        </div>                        
                        <h5 class="card-header"></h5>         
                        <h5 class="card-header"></h5>         
                        <h5 class="card-header">Datos Financieros</h5>                
                      
                        <div class="form-group">
                            <label for="correo_paypal" class="col-form-label">Correo PayPal</label>
                            <input id="correo_paypal" name="correo_paypal" type="text" class="form-control {{ $errors->has('correo_paypal') ? ' is-invalid' : '' }}" value="">

                            @if ($errors->has('correo_paypal'))
                            <div class="invalid-feedback">
                                <strong>{{ $errors->first('correo_paypal') }}</strong>
                            </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="cuenta_bancaria_eeuu" class="col-form-label">Cuenta Bancaria en Estados Unidos</label>
                            <input id="cuenta_bancaria_eeuu" name="cuenta_bancaria_eeuu" type="text" class="form-control {{ $errors->has('cuenta_bancaria_eeuu') ? ' is-invalid' : '' }}" value="">

                            @if ($errors->has('cuenta_bancaria_eeuu'))
                            <div class="invalid-feedback">
                                <strong>{{ $errors->first('cuenta_bancaria_eeuu') }}</strong>
                            </div>
                            @endif
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-form-label">Foto de Frente</label>
                            <input type="file" class="form-control-file {{ $errors->has('image') ? ' is-invalid' : '' }}" id="p_image" name="image">

                            @if ($errors->has('image'))
                            <div class="invalid-feedback">{{ $errors->first('image') }}</div>
                            @endif
                        </div>
                       
                        <div class="form-group">
                            <label for="uploaded_image">Imagen actual</label>
                           
                        </div>
                        <div class="form-group">
                            <label for="politicamente_expuesta" class="col-form-label">Persona Politicamente Expuesta</label>
                            <input id="politicamente_expuesta" name="politicamente_expuesta" type="text" class="form-control {{ $errors->has('politicamente_expuesta') ? ' is-invalid' : '' }}" value="">

                            @if ($errors->has('politicamente_expuesta'))
                            <div class="invalid-feedback">
                                <strong>{{ $errors->first('politicamente_expuesta') }}</strong>
                            </div>
                            @endif
                        </div>
                        <div class="row">
                            <div class="col-sm-6 pl-0">
                                <p class="text-right">
                                    <a href="" class="btn btn-sm btn-secondary" role="button">Volver</a>
                                    <button class="btn btn-sm btn-primary" type="submit">Guardar cambios</button>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 pb-2 pb-sm-4 pb-lg-0 pr-0">
                                
                            </div>
                            <div class="col-sm-6 pl-0">
                              
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@else
<div class="alert alert-danger" role="alert">
    No tienes permiso para editar.
</div>
@endcan
@stop

@push('styles')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css">
@endpush

@push('javascript')
<script src="https://cdn.ckeditor.com/4.11.2/standard/ckeditor.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.full.min.js"></script>
<script>
    $('.select2').select2();
    CKEDITOR.replace( 'p_body' );
</script>



  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript">

        $('.date').datepicker({  

        format: 'dd-mm-yyyy',
        language: "es",
        autoclose: true
        });  

</script>  
@endpush
