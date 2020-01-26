@extends('layouts.dashboard')

@section('page_title', 'Tablero')

@section('title_icon_class', 'fas fa-tachometer-alt')

@section('module_title', 'Tablero')




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
@can('dashboard.view')
<div id="page-wrapper">
    
            <div class="container-fluid">                
                <div class="row">
             
                   
                <!-- ============================================================== -->
                <!-- table -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="light-box">                            
                            <h3 class="box-title">Mis Inversiones </h3>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            
                                            <th>Proyecto</th>                                            
                                            <th>Fecha</th>
                                            <th>Monto Invertido</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        @foreach($misinversiones as $mi)
                                            <td class="txt-oflo">{{$mi->title}}</td>                                            
                                            <td class="txt-oflo">{{date('d-m-Y', strtotime($mi->fecha_inversion))}}</td>
                                            <td><span class="text-success">U$D {{$mi->dinero_invertido}}</span></td>
                                        
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
@else
<div class="alert alert-danger" role="alert">
    No tienes permisos para visualizar el tablero principal.
</div>
@endcan

@stop
