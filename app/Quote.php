<?php namespace App;

use Illuminate\Database\Eloquent\Model;

class Quote extends Model {

	 protected $table = 'quotes';

	public function comments()
    {
        return $this->hasMany('App\Comment');
    }

}
