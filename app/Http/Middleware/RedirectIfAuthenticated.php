<?php namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\RedirectResponse;

use App\Quote;
use Auth;

class RedirectIfAuthenticated {

	/**
	 * The Guard implementation.
	 *
	 * @var Guard
	 */
	protected $auth;

	/**
	 * Create a new filter instance.
	 *
	 * @param  Guard  $auth
	 * @return void
	 */
	public function __construct(Guard $auth)
	{
		$this->auth = $auth;
	}

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
		if ($this->auth->check())
		{

			/*$nb=env('NB_QUOTES');
			$newQuotes=Quote::whereNotNull('numero')->orderBy('numero', 'DESC')->paginate($nb);
			$topQuotes=Quote::whereNotNull('numero')->orderBy('like', 'DESC')->paginate($nb);
			$flopQuotes=Quote::whereNotNull('numero')->orderBy('dislike', 'DESC')->paginate($nb);
			$randQuotes=Quote::whereNotNull('numero')->orderByRaw("RAND()")->paginate($nb);

			return view('index')->with(array(
				'newQuotes' => $newQuotes,
				'topQuotes' => $topQuotes,
				'flopQuotes'=> $flopQuotes,
				'randQuotes'=> $randQuotes
				));*/

			return new RedirectResponse(url('/'));

		}

		return $next($request);
	}

}
