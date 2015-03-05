@extends('layouts.default')

@section('content')
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="page-header"><h1>Connexion</h1></div>
				<div class="panel-body">
					@if (count($errors) > 0)
						<div class="alert alert-danger">
							<strong>Whoops!</strong> Les champs ci-dessous ne sont pas corrects.<br><br>
							<ul>
								@foreach ($errors->all() as $error)
									<li>{{ $error }}</li>
								@endforeach
							</ul>
						</div>
					@endif
					
					<div style="width:100%; text-align:center;">
						<a href="{!! URL::to('auth/login/fb') !!}">
							<img  src="{!! URL::to('img/facebook-login.png') !!}" alt="facebook">
						</a>
						
						<br>
						<div class="page-header"><h2>OU</h2></div>
					</div>



					{!! Form::open(array('url' => "auth/postLogin", 'class'=>'well')) !!}
						<input type="hidden" name="_token" value="{{ csrf_token() }}">

						<div class="form-group">
							<label class="col-md-4 control-label">Nom d'utilisateur</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="pseudo" value="{{ old('pseudo') }}">
							</div>
						</div>

						<div class="form-group">
							<label class="col-md-4 control-label">Mot de passe</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="password">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-6 col-md-offset-4">
								<div class="checkbox">
									<label>
										<input type="checkbox" name="remember"> Se souvenir de moi
									</label>
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="col-md-6 col-md-offset-4">
								<button type="submit" class="btn" style="margin-right: 15px;">
									Connexion
								</button>

								<a href="/password/email">Mot de passe oublié ?</a>
							</div>
						</div>
					{!! Form::close() !!}
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
