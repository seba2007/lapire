<?php namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Quote;
use App\Parametre;
use View;

class AppServiceProvider extends ServiceProvider {

	/**
	 * Bootstrap any application services.
	 *
	 * @return void
	 */
	public function boot()
	{
		$nbQuotes=Quote::whereNull('numero')->count();
		$param= Parametre::find(1);
		View::share(array(
			'nbQuotes'=> $nbQuotes,
			'param' => $param,
			));
	}

	/**
	 * Register any application services.
	 *
	 * This service provider is a great spot to register your various container
	 * bindings with the application. As you can see, we are registering our
	 * "Registrar" implementation here. You can add your own bindings too!
	 *
	 * @return void
	 */
	public function register()
	{
		$this->app->bind(
			'Illuminate\Contracts\Auth\Registrar',
			'App\Services\Registrar'
		);
	}

}
