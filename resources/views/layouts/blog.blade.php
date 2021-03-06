<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>{{ config('app.name', 'CROWDFINT') }}</title>
    <link href="{{ asset('/clean-blog/styles/app.css') }}" rel="stylesheet" type='text/css'>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
         
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            @if (Route::has('login'))
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        @auth
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/') }}">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ url('/home') }}">Plataforma</a>
                        </li>
                        @else
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">Ingresar</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">Registrarme</a>
                                </li>
                            @endif
                        @endauth
                    </ul>
                </div>
            @endif
        </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    @yield('header')
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        @yield('content')
    </div>

    <hr>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                <p class="copyright text-muted">Copyright &copy; <script>var d = new Date(); document.write(d.getFullYear());</script> <a>CROWDFINT</a>. Todos los derechos reservados.</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="{{ asset('/clean-blog/scripts/app.js') }}"></script>
</body>
</html>
