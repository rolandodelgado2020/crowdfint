@extends('layouts.dashboard')

@section('page_title', 'Publicaciones')



@section('subtitle', 'Listado de Proyectos de inversion.')

@section('breadcrumbs')
{{ Breadcrumbs::render('posts') }}
@stop


@section('content')
    @can('posts.create')
    <a href="{{ route('posts.create') }}" class="btn btn-sm btn-success" role="button">
        <i class="fas fa-plus-circle"></i> Crear publicación
    </a>
    @endcan

    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <div class="card-body">
                   
                        
                            <div class="row">
                                <div class="preamble col s12 wow fadeIn" data-wow-duration="0.7s" style="visibility: visible; animation-duration: 0.7s; animation-name: fadeIn;">
                                    <h2>Proyectos Inmobiliarios <span class="heading-divider"></span></h2>
                                </div>
                            </div>
											<div class="container">					
												<div class="card-deck mb-3 text-center">
													
														<div class="container">	
															<div class="row align-items-start">
															@php ($cant = 0)
															@foreach($posts as $post)
															@if ($cant == 3)
															</div>
															</div>
															<div class="container">	
															<div class="row align-items-start">
															@php ($cant = 0)
															@endif
																<div class="card mb-4 shadow-sm">
																	<div class="card-header">
																		<h4 class="my-0 font-weight-normal  bg-info">{{ $post->title }}</h4>
																	</div>

																	<div class="card-body">
																	<img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x250]" style="height: 250px; width: 100%; display: block;" src="{{ asset( '/img/'.$post->image ) }}" data-holder-rendered="true">

																	
																		<h1 class="card-title pricing-card-title">$40 - 30 %</small></h1>
																		<ul class="list-unstyled mt-3 mb-4">
																		<li>{{ $post->subtitle }}</li>
																		<li>{{ $post->slug }}</li>
																		<li>{{ $post->slug }}</li>
																		<li>{{ $post->slgu }}</li>
																		</ul>

																		<div class="btn-group ml-auto">
																			<a href="{{ route('post', $post->slug) }}" class="btn btn-sm btn-outline-light">
																			<button type="button" class="btn btn-primary">MAS INFO</button>
																			</a>
																		@if ( $user->id_registracion_estado  == 2)
																	
																			@can('posts.payment')
																			<a href="{{ route('posts.payment', $post->id) }}" class="btn btn-sm btn-outline-light">
																				<i class="fas fa-edit"></i> Invertir
																			</a>
																			@endcan                                           
																		@else
																			@can('posts.registro_financiero')
																			<a href="{{ route('posts.registro_financiero', $user->id) }}" class="btn btn-sm btn-outline-light">
																			<button type="button" class="btn btn-primary">INVERTIR</button>
																			</a>
																			@endcan
																		@endif                                           
                                        								</div>

																		
																	</div>
																</div>
																
																
																
															
																@php ($cant = $cant +1)

																@endforeach		
															</div>	
														</div>			
												
												</div>
											</div>



				
			
								
                               
        </div>
    </div>

    
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  
@stop

@push('javascript')  

    <script>
 <!-- DataTables -->
        $(document).ready(function () {
            $('.table').DataTable({
                "order": [],
                "columns": [
                    { "orderable": true, "searchable": true },
                    { "orderable": false, "searchable": true },
                    { "orderable": false, "searchable": false },
                    { "orderable": true, "searchable": true },
                    { "orderable": true, "searchable": false },
                    { "orderable": true, "searchable": false },
                    { "orderable": false, "searchable": false },
                ]
            });
        });

        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('posts.destroy', ['post' => '__post']) }}'.replace('__post', $(this).data('id'));

            $('#delete_modal').modal('show');
        });
    </script>
	}
	
@endpush
