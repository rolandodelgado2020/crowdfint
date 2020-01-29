@extends('layouts.dashboard')

@section('page_title', 'Mi Actividad')

@section('title_icon_class', 'fas fa-tachometer-alt')

@section('module_title', 'Mi Actividad')




<link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- chartist CSS -->
    <link href="plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="css/colors/default.css" id="theme" rel="stylesheet">
@section('content')

<div id="page-wrapper">
    
            <div class="container-fluid">                
                <div class="row">
             
                   
                <!-- ============================================================== -->
                <!-- table -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="light-box">                            
                            <h3 class="box-title"></h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            
                                        <th>Movimiento</th>                                            
                                            <th>Fecha</th>
                                            <th>Monto</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        @foreach($miactividad as $act)
                                            <td class="txt-oflo">{{$act->nombre}}</td>                                            
                                            <td class="txt-oflo">{{date('d-m-Y', strtotime($act->fecha_movimiento))}}</td>
                                            <td><span class="text-success">{{$act->monto_usd}}</span></td>
                                        
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- chat-listing & recent comments -->
                <!-- ============================================================== -->
                



            </div>
        </div>
    </div>
</div>
<div class="row">
                        <div class="col-sm-12 pl-0">
                            <p class="text-center">
                                <a href="{{ route('home') }}" class="btn btn-sm btn-secondary" role="button">Volver</a>
                                
                            </p>
                        </div>
                    </div>



@stop
