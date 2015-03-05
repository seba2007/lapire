@extends('layouts.default')
@section('content')

<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="page-header"><h1>Postez votre #Pire</h1></div>
				<div class="panel-body">
					
					<div class="alert alert-danger">
						Votre #Pire devra être validée par un administrateur et respecter les règles avant d'être visible sur le site.
						<br>
						@if(Session::has('error_tps'))
							<br>
							<ul>
								<li>{!! Session::get('error_tps') !!}</li>
							</ul>
						@endif
						@if (count($errors) > 0)
							<strong>Whoops!</strong> Les champs ci-dessous ne sont pas corrects.<br><br>
							<ul>
								@foreach ($errors->all() as $error)
									<li>{{ $error }}</li>
								@endforeach
							</ul>
						@endif
					</div>
					

					{!! Form::open(array('url' => "submit-quote/postSubmit", 'class'=>'well', 'name'=>'addQuote')) !!}
						<input type="hidden" name="_token" value="{{ csrf_token() }}">

						<div class="form-group">
							Votre #Pire :
							<br><br>
							<div class="col-md-6">
								Hier, {!! Form::textarea('quote',"",array('class'=>'input-xxlarge','onKeyDown'=>"limiteur();", 'onKeyUp'=>"limiteur();")) !!}
							</div>
							&emsp;&emsp;#LaPire
							<br>
							<h5>Il vous reste <span id="indicateur">750</span> caractères.</h5>
						</div>
						<br>
						<div class="form-group">
							<div class="col-md-6 col-md-offset-4">
								<div class="checkbox">
									@if(Auth::check())
										{!! Form::checkbox('anonyme') !!} Envoyer anonymement ({!! Auth::user()->pseudo !!} s'affichera si vous décochez)
									@else
										Votre #Pire sera postée anonymement si vous ne vous connnectez pas
									@endif
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="col-md-6 col-md-offset-4">
								<button type="submit" class="btn" style="margin-right: 15px;">
									Envoyer
								</button>
							</div>
						</div>
					{!! Form::close() !!}
				</div>
			</div>
		</div>
	</div>
</div>


@endsection 

<script>
	function limiteur()
	{
		maximum = 750;
		champ = document.addQuote.quote;
		indic = document.getElementById('indicateur');

		if (champ.value.length > maximum)
		  champ.value = champ.value.substring(0, maximum);
		else 
		{
			restant = maximum - champ.value.length;
			indic.innerHTML=restant;
		}
		
	}
</script>