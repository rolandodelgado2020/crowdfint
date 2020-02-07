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
                @foreach($data as $m)
                     <div class="col-lg-4 col-sm-6 col-xs-12">
              
                        <div class="white-box analytics-info">
                            <h3 class="box-title">SALDO INVERTIDO</h3>
                            <ul class="list-inline two-part">
                                <li>                                 
                                    <li class="text-center">
                                    <i class="ti-arrow-up text-BLACK"></i> <h3 class="box-title  text-BLACK">U$D {{$m->saldo_invertido}} </h3></li>

                                </li>
                               
                            </ul>
                        </div>
                    </div>          
                    <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="white-box analytics-info">
                            <h3 class="box-title">DISPONIBLE</h3>
                            <ul class="list-inline two-part">
                                <li>
                                    <div id="sparklinedash3"></div>
                                </li>
                                <li class="text-left"><i class="ti-arrow-up text-info"></i> <h3 class="box-title  text-info">U$D {{$m->disponible}} </h3></li>
                            </ul>
                        </div>
                    </div>
                </div>
                @endforeach
              
                <div class="row">
                <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="white-box">
                            <h3 class="box-title"></h3>
                            <ul class="list-inline text-left">
                            <a class="nav-link nav-user-img" href="{{ route('posts.index') }}" id="img2"  aria-haspopup="true" aria-expanded="false"><img  src="{{ asset('/img/invertir.png') }}" alt="INVERTIR" class="user-avatar-xl rounded-circle"></a>
                            <li class="text-left">Invertir </li>
                           
                            </ul>
                            <div id="ct-visits" style="height: 30px;"></div>
                        </div>
                </div>
                 <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="white-box">
                            <h3 class="box-title"></h3>
                            <ul class="list-inline text-left">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="{{ asset('/img/transferir.png') }}" alt="INVERTIR" class="user-avatar-xl rounded-circle"></a>
                            <li class="text-left">Transferir </li>
                           
                            </ul>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="white-box">
                            <h3 class="box-title"></h3>
                            <ul class="list-inline text-left">
                            <a class="nav-link nav-user-img" href="#" id="{{ route('posts.list') }}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="{{ asset('/img/retirar.png') }}" alt="INVERTIR" class="user-avatar-xl rounded-circle"></a>
                            <li class="text-left">Retirar</li>
                           
                            </ul>
                            
                        </div>
                    </div>
            </div>

                <!--/.row -->
                <!--row -->
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <div class="white-box">
                            <h3 class="box-title"></h3>
                            <ul class="list-inline text-left">
                            <a href="{{ route('home.misinversiones',$id) }}" class="btn btn-sm btn-outline-light">
				            <i class="fas fa-edit">MIS PROYECTOS</i> 	</a>
                               
                            </ul>
                            <div id="ct-visits" style="height: 50px;"></div>
                        </div>
                    </div>
                </div>
               
                <!-- ============================================================== -->
                <!-- table -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="light-box">                            
                            <h3 class="box-title">Mi Actividad</h3>
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
@else
<div class="alert alert-danger" role="alert">
    No tienes permisos para visualizar el tablero principal.
</div>
@endcan


@can('home.misinversiones')

@endcan
@stop
