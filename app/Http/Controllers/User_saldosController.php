<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use App\User;
use App\Category;
use App\Tag;
use App\User_saldos;

use DB;
class User_saldosController extends Controller
{
    /**
     * Muestra el blog principal con cinco publicaciones
     * por cada página ordenadas por fecha de creación
     * descendente.
     *
     * @return \Illuminate\Http\Request
     */
    
    public function index()
    {
        $id=Auth::user()->id;
        $data=User_saldos::table('user_saldos')
        ->select('user_saldos.disponible','user_saldos.saldo_dolar','user_saldos.saldo_invertido')
        ->join('users','users.id','=','user_saldos.id_user')
        ->where('users.id', $id)
        ->get();

        return view('home');
    }
    public function User_saldos()
    {
        $id=Auth::user()->id;
        $data=User_saldos::table('user_saldos')
        ->select('user_saldos.disponible','user_saldos.saldo_dolar','user_saldos.saldo_invertido')
        ->join('users','users.id','=','user_saldos.id_user')
        ->where('users.id', $id)
        ->get();

        //return view('home');
    }
    
    
}
