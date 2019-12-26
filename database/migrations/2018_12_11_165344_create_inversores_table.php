<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateinversoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inversores', function (Blueprint $table) {
            $table->increments('id');
            $table->string('invApyNombre');                 
            $table->string('invCelular')->nullable($value = true);
            $table->string('invCorreo')->unique();
            $table->string('invPassword');      
            $table->rememberToken(); $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inversores');
    }
}
