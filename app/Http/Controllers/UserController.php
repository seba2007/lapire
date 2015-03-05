<?php namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use App\User;
use Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller {

	public function activation($token)
	{
		$user = User::where('token', $token)->first();

		if(isset($user))
		{
			if($user->active==0)
			{
				$user->active=1;
				$user->save();
				Auth::login($user);
				return redirect('/')->with('alert_success', "Votre compte a été activé avec succès.");
			}
			else
				return redirect('/')->with('alert_error', "Votre compte a déjà été activé.");
		}
		else
			return redirect('/')->with('alert_error', "Whoops, une erreur s'est produite.");
	}

	public function getProfile()
	{
		return view('users.profile');
	}

	public function postMyAccount(Request $request)
	{
		if(Auth::user()->facebook==1)
		{
			$this->validate($request, [
		        'pseudo' => 'required|min:3|max:20|alpha_num|unique:users',
	    	]);
		}	
		else
		{
			$this->validate($request, [
		        'password' => 'required_with:old_password|min:6|max:40|confirmed',
		        'old_password' => 'required_with:password, password_confirmation',
	    	]);
		}
		

		$user=Auth::user();
		
		if($request->has('pseudo'))
		{
			$pseudo=e($request->input('pseudo'));
			$user->pseudo=$pseudo;
			$user->profile->changePseudo=1;
			$user->save();
			$user->profile->save();

			return redirect('profile')->with('alert_success', "Nouveau nom d'utilisateur sauvegardé");
		}

		$old_password=e($request->input('old_password'));

		if(!Hash::check($old_password, $user->password))
			return redirect('profile')->with('error', "Mot de passe actuel incorrect");


			

		$new_password = e($request->input('password'));
		$new_password = Hash::make($new_password);
		$user->password = $new_password;
		$user->save();

		return redirect('profile')->with('alert_success', "Changements sauvegardés");


	}
}
