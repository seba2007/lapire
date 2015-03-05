@extends('layouts.default')
@section('content')
<?php 
	$user=Auth::user();
?>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="page-header"><h1>Mon compte</h1></div>
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

					@if (Session::has('error'))
						<div class="alert alert-danger">
							<strong>Whoops!</strong> Les champs ci-dessous ne sont pas corrects :<br><br>
							<ul>
								<li>{!! Session::get('error') !!}</li>
							</ul>
						</div>
					@endif
					

					{!! Form::open(array('url' => "profile/postMyAccount", 'class'=>'well')) !!}
						<input type="hidden" name="_token" value="{{ csrf_token() }}">
						@if($user->facebook==1)
							<div class="form-group">
								<span class="col-md-4 control-label">Connecté par facebook via : </span>
								<div class="col-md-6">
									<i><b>{!! $user->profile->username !!}</b> </i>
								</div>
							</div>
							<br>
							<div class="form-group">
								<span class="col-md-4 control-label">Nom d'utilisateur : </span>
								<div class="col-md-6">
									@if($user->profile->changePseudo==0)
										{!! Form::text('pseudo', "$user->pseudo") !!}
										<br><br>
										<div class="alert alert-danger">
											<ul>
												<li><strong>Attention ! </strong>Vous ne pourrez changer de pseudo qu'une seule fois si vous ne souhaitez pas utiliser votre nom Facebook</li>
											</ul>
										</div>
									@else
										<i><b>{!! $user->pseudo !!}</b> </i>
									@endif
									<br><br>
								</div>
							</div>
						@else
							<div class="form-group">
								<span class="col-md-4 control-label">Nom d'utilisateur : </span>
								<div class="col-md-6">
									<i><b>{!! $user->pseudo !!}</b> </i>
								</div>
							</div>
							<br>
							<div class="form-group">
								<span class="col-md-4 control-label">E-mail : </span>
								<div class="col-md-6">
									<i><b>{!! $user->email !!}</b> </i>
								</div>
							</div>

							<hr>
							<h3>Changement de votre mot de passe : </h3>
							<br>
							<div class="form-group">
								<span class="col-md-4 control-label">Mot de passe actuel : </span>
								<div class="col-md-6">
									{!! Form::password('old_password', "") !!}
								</div>
							</div>
							<br>
							<div class="form-group">
								<span class="col-md-4 control-label">Nouveau mot de passe : </span>
								<div class="col-md-6">
									{!! Form::password('password', "") !!}
								</div>
							</div>
							<br>
							<div class="form-group">
								<span class="col-md-4 control-label">Confirmez le mot de passe : </span>
								<div class="col-md-6">
									{!! Form::password('password_confirmation', "") !!}
								</div>
							</div>
							<br><br>
						@endif

						@if( $user->facebook==1 && $user->profile->changePseudo != 1)
							{!! Form::submit('Sauvegarder', array('class'=>'btn')) !!}
						@else
							@if($user->facebook==0)
								{!! Form::submit('Sauvegarder', array('class'=>'btn')) !!}
							@endif
						@endif

					{!! Form::close() !!}
				</div>
			</div>
		</div>
	</div>
</div>

@endsection