<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\CreatePostFormRequest;
use App\Http\Requests\CreateRegistroFinancieroFormRequest;
use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\UpdatePostFormRequest;
use App\Post;
use App\Category;
use App\Tag;
use Illuminate\Support\Facades\Validator;

use Illuminate\Database\Eloquent\Builder;
use App\User;
use App\Role;
use App\Pais;
use App\Origenfondos;
use App\Permission;
use App\Registro_financiero;
use App\PermissionGroup;
use App\Http\Requests\UserFormRequest;

class PostController extends Controller
{
    /**
     * Protege los métodos del controlador por medio de permisos
     * y utilizando el middleware del paquete de roles y permisos.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('permission:posts.list', ['only' => ['index', 'show']]);
        $this->middleware('permission:posts.create', ['only' => ['create', 'store']]);
        $this->middleware('permission:posts.edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:posts.destroy', ['only' => ['destroy']]);
        $this->middleware('permission:posts.payment', ['only' => ['payment']]);
        $this->middleware('permission:posts.registro_financiero', ['only' => ['registro_financiero']]);
        $this->middleware('permission:posts.registro_financiero_guardar', ['only' => ['registro_financiero_guardar']]);
   
    }

    /**
     * Muestra un listado de las publicaciones existentes.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $posts = Post::all();

        return view('post.index', compact('posts'),compact('user'));
    }

    /**
     * @todo: Move CKEditor from CDN to Laravel Mix.
     * Muestra el formulario para crear una nueva etiqueta.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tags = Tag::all();
        $categories = Category::all();

        return view('post.create', compact('tags', 'categories'));
    }

    /**
     * @todo: Make throw exceptions.
     * Almacena una nueva categoría en la base de datos.
     *
     * @param  \App\Http\Requests\CreatePostFormRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CreatePostFormRequest $request)
    {
        $formData = $request->all();
        $user = Auth::user();

        if ($request->file('image')->isValid()) {
            // Store the file
            $path = $request->image->store('images/posts', 'public');
        }

        $formData['status']     = $request->input('status');
        $formData['posted_by']  = $user->id;
        $formData['image']      = $path;

        $post = Post::create($formData);
        $post->categories()->sync($formData['categories']);
        $post->tags()->sync($formData['tags']);

        return redirect()
            ->route('posts.index')
            ->with([
                'message'    => 'Publicación creada con éxito.',
                'alert-type' => 'success'
            ]);
    }

    /**
     * Muestra una publicación en específico.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * @todo: Move CKEditor from CDN to Laravel Mix.
     * Muestra el formulario para editar una publicación
     * en específico.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        $tags = Tag::all();
        $categories = Category::all();

        return view('post.edit', compact('post', 'tags', 'categories'));
    }

 /**
     * @todo: Move CKEditor from CDN to Laravel Mix.
     * Muestra el formulario para invertir en una publicación
     * en específico.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function payment(Post $post)
    {
        $tags = Tag::all();
        $categories = Category::all();

        return view('post.payment', compact('post', 'tags', 'categories'));
    }


    public function registro_financiero()
    {
        $user = Auth::user();
        $paises = Pais::all();  
        $registros_financiero = Registro_financiero::all();

        return view('post.registro_financiero', compact('user','paises'));
    }


 

    public function registro_financiero_guardar(CreateRegistroFinancieroFormRequest $request, User $user)
    {
        $formData = $request->all();
        $user = Auth::user();
        $user->apellidoynombre    = $request->input('apellidoynombre') ;
            $user->correo_paypal    = $request->input('correo_paypal') ;
       
      $user->save();
       // $usuario->update($formData);
       
        return redirect()
        ->route('posts.index')
        ->with([
            'message'    => 'Datos actualizados con éxito.',
            'alert-type' => 'success'
        ]);
        
    }



    /**
     * @todo: Make throw exceptions.
     * Actualiza la publicación especificada en la base de datos.
     *
     * @param  \App\Http\Requests\UpdatePostFormRequest  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePostFormRequest $request, Post $post)
    {
        $formData = $request->all();
        $user = Auth::user();

        if ($request->hasFile('image')) {
            if ($request->file('image')->isValid()) {
                // Delete the old image
                $post->deleteImage();
                $path = $request->image->store('images/posts', 'public');
            }
            else {
                $path = $post->image;
            }
        }
        else {
            $path = $post->image;
        }

        $formData['status']     = $request->input('status');
        $formData['posted_by']  = $user->id;
        $formData['image']      = $path;

        $post->update($formData);
        $post->tags()->sync($formData['tags']);
        $post->categories()->sync($formData['categories']);

        return redirect()
            ->route('posts.index')
            ->with([
                'message'    => 'Publicación actualizada con éxito.',
                'alert-type' => 'success'
            ]);
    }

    /**
     * Retira la publicación especificada y su archivo de imagen
     * anexada de la base de datos.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        if ($post->delete()) {
            return redirect()
                ->route('posts.index')
                ->with([
                    'message'    => 'Publicación eliminada con éxito.',
                    'alert-type' => 'success',
                ]);
        }

        return redirect()->route('posts.index');
    }
}
