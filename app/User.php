<?php namespace App;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class User extends Model implements AuthenticatableContract, CanResetPasswordContract {

	use Authenticatable, CanResetPassword;

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['pseudo', 'email', 'password','activated','token'];

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = ['password', 'remember_token'];

	public function profile()
    {
        return $this->hasOne('App\Profile');
    }

    public function comments()
    {
        return $this->hasMany('App\Comment');
    }

    public function votesComment()
    {
        return $this->hasMany('App\VotesComment');
    }

    public function getRememberToken()
    {   
    	return $this->remember_token;
    }

    public function setRememberToken($value)
    {
    	$this->remember_token = $value;
    }   

    public function getRememberTokenName()
    {
    	return 'remember_token';
    }




}
