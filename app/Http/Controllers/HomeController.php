<?php

namespace App\Http\Controllers;


use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Builder;
use App\User_saldos;
use App\Misinversiones;
use DB;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission:home.misinversiones', ['only' => ['misinversiones']]);
       
    }
    public function Saldo()
    {
        return $this->hasOne('App\User_saldos');
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function User_saldos()
    {
        $id=Auth::user()->id;
        $data=DB::table('user_saldos')
        ->select('user_saldos.disponible','user_saldos.saldo_dolar','user_saldos.saldo_invertido')
        ->join('users','users.id','=','user_saldos.id_user')
        ->where('users.id', $id)
        ->get();

        //return view('home');
    }
    public function misinversiones(int $id){
        
        $misinversiones=DB::table('user_proyecto_invertido')
        ->select('posts.title','user_proyecto_invertido.id_user','user_proyecto_invertido.id_post','user_proyecto_invertido.dinero_invertido','user_proyecto_invertido.fecha_inversion')
        ->join('users','users.id','=','user_proyecto_invertido.id_user')
        ->join('posts','posts.id','=','user_proyecto_invertido.id_post')
        ->where('users.id', $id)
        ->orderBy('user_proyecto_invertido.fecha_inversion','DESC')
         ->get();
        return view('misinversiones',compact('misinversiones'));
    }
    public function index()
    {
        $id=Auth::user()->id;
        $data=DB::table('user_saldos')
        ->select('user_saldos.disponible','user_saldos.saldo_dolar','user_saldos.saldo_invertido')
        ->join('users','users.id','=','user_saldos.id_user')
        ->where('users.id', $id)
        ->orderBy('user_saldos.fecha_saldo','DESC')
        ->take(1)
        ->get();

        $miactividad=DB::table('user_movimientos')
        ->select('tipo_movimiento.nombre','user_movimientos.id_tipo_movimiento','user_movimientos.fecha_movimiento','user_movimientos.monto_usd')
        ->join('users','users.id','=','user_movimientos.id_user')
        ->join('tipo_movimiento','tipo_movimiento.id_tipo','=','user_movimientos.id_tipo_movimiento')
        ->where('users.id', $id)
        ->orderBy('user_movimientos.fecha_movimiento','DESC')
        ->take(3)
        ->get();




        return view('home',compact('data','miactividad','id'));
    }
    
}
