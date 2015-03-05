<?php



/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

//GET
	Route::get('/', 					'WelcomeController@index');
	Route::get('home', function(){
		return view('index');
	});

	Route::get('btnLike/{id}',				'WelcomeController@btnLike');
	Route::get('btnDislike/{id}',			'WelcomeController@btnDislike');

	Route::get('quote/{id}',				'QuoteController@getQuote');
	Route::get('likeComment/{type}/{id}',	'QuoteController@getVote');
	Route::get('submit-quote',				'QuoteController@getSubmitQuote');

//POST
	Route::post('submit-quote/postSubmit',	'QuoteController@postSubmitquote');


$router->group(['middleware' => 'guest'], function() {

    //GET
    Route::get('auth/register', 		'SessionController@register');
    Route::get('auth/login', 			'SessionController@login');
    Route::get('activation/{token}',	'UserController@activation');

    //FaceBook
	Route::get('auth/login/fb',         'FacebookController@loginFb');
	Route::get('auth/login/fb/callback','FacebookController@loginFbCallback');



	//POST
	Route::post('auth/postLogin',		'SessionController@postLogin');
	Route::post('auth/postRegister',	'SessionController@postRegister');
});

$router->group(['middleware' => 'auth'], function() {

	//GET
	Route::get('auth/logout', 						'SessionController@logout');
	Route::get('profile',							'UserController@getProfile');

	//Admin
	Route::get('admin',								'AdminController@getAdmin');
	

	//POST
	Route::post('postComment/{answer}',			'QuoteController@postComment');
	Route::post('profile/postMyAccount',		'UserController@postMyAccount');
});

$router->group(['middleware' => 'admin'], function() {

	//GET
	Route::get('admin',								'AdminController@getAdmin');
	Route::get('admin/new-quotes',					'AdminController@getNewQuotes');
	Route::get('admin/valider-quote/{id}',			'AdminController@validerNewQuote');
	Route::get('admin/modifier-quote/{id}',			'AdminController@modifierQuote');
	Route::get('admin/supprimer-quote/{id}',		'AdminController@supprimerQuote');
	Route::get('admin/parametres',					'AdminController@getParametres');
	Route::get('admin/delete-comment/{id}',			'AdminController@deleteComment');
	Route::get('admin/valider-comment/{id}',		'AdminController@validerComment');


	//POST
	Route::post('admin/post-modifier-quote',		'AdminController@postModifierQuote');
	Route::post('admin/postResearch-quote',			'AdminController@postResearchQuote');
});
	


	

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);