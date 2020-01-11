@extends('layouts.dashboard')

@section('page_title', 'Inversion')

@section('module_title', 'Inversion')

@section('subtitle', 'Invertir en un proyecto.')
@section('content')
@can('posts.payment')
<script src="https://js.stripe.com/v3/"></script>
<script>
var stripe = Stripe("{{ config('services.stripe.key') }}");
</script>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Detalle del Pago
                    </h3>
                    <div class="checkbox pull-right">
                        <label>
                            <input type="checkbox" />
                            Recordar
                        </label>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form">
                    <div class="form-group">
                        <label for="cardNumber">
                            TARJETA NUMERO</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number"
                                required autofocus />
                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-7 col-md-7">
                            <div class="form-group">
                                <label for="expityMonth">
                                    FECHA VENCIMIENTO </label>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityMonth" placeholder="MM" required />
                                </div>
                                <div class="col-xs-6 col-lg-6 pl-ziro">
                                    <input type="text" class="form-control" id="expityYear" placeholder="YY" required /></div>
                            </div>
                        </div>
                        <div class="col-xs-5 col-md-5 pull-right">
                            <div class="form-group">
                                <label for="cvCode">
                                    CV CODIGO</label>
                                <input type="password" class="form-control" id="cvCode" placeholder="CV" required />
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
            <ul class="nav nav-pills nav-stacked">
            <input type="text2" class="form-control" id="total" placeholder="MONTO TOTAL USD"
                                required autofocus />
                
                </li>
            </ul>
            <br/>
            <a href="http://www.jquery2dotnet.com" class="btn btn-success btn-lg btn-block" role="button">Pagar</a>
        </div>
    </div>
</div>

@endcan
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
@endpush