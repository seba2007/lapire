<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Auth;
use App\User;


class SessionController extends Controller {

	public function login()
	{
		return view('auth.login');
	}

	public function register()
	{
		return view('auth.register');
	}

	public function logout()
	{
		Auth::logout();
		return redirect('/')->with('alert_success',"Vous êtes maintenant déconnecté.");
	}

	public function postLogin(Request $request)
	{
		$pseudo=e($request->input('pseudo'));
		$password=e($request->input('password'));
		$remember = ($request->has('remember')) ? true : false;  

		if (!Auth::attempt(['pseudo' => $pseudo, 'password' => $password]))
		{
		    return redirect('auth/login')->with('alert_error', "Le nom d'utilisateur et/ou le mot de passe n'est pas correct.");
		}

		if (!Auth::attempt(['pseudo' => $pseudo, 'password' => $password, 'active' => 1], $remember))
		{
		    return redirect('auth/login')->with('alert_error', "Vous devez acriver votre compte avec le lien se trouvant dans le mail de confirmation.");
		}

		return redirect('/')->with('alert_success','Vous êtes maintenant connecté.');
	}

	public function postRegister(Request $request)
	{
		$this->validate($request, [
        'pseudo' => 'required|min:3|max:20|alpha_num|unique:users',
        'password' => 'required|min:6|max:40|confirmed',
        'email' => 'required|email|unique:users'
    	]);
		
		$pseudo=e($request->input('pseudo'));
		$password=e($request->input('password'));
		$password= Hash::make($password);
		$email=e($request->input('email'));
		$token = sha1(uniqid(rand()));
		$active = 0;

		$user=User::create(array(
			'pseudo'	=>	$pseudo,
			'password'	=>	$password,
			'email'		=>	$email,
			'token'		=>	$token,
			'active'	=>  $active
		));
		
		//Envoi de l'e-mail de confirmation
    	/*$data = array(
        'prenom'=>Input::get('prenom'),
        'email'=>Input::get('mail'),
        'token'=>$token,
        );

			Mail::send('emails.inscription',$data,function($m) use ($data)
    	{
        $m->to($data['email'],$data['prenom']);
        $m->subject(trans('messages.sujetMailInscription'));
    	});*/

    	return redirect('/')->with('alert_success',"Un e-mail de confirmation a été envoyé à votre adresse e-mail.");

		
	}

}
