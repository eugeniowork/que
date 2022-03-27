<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
	use Notifiable;

	protected $fillable = ['firstname', 'lastname', 'email',  'password', 'department_id', 'mobile', 'photo', 'user_type', 'remember_token', 'status'];
	
    protected $hidden = ['password', 'remember_token'];

    public $timestamps = false;

    protected $table = "user";

    protected $avaliableRoles = [
        'ADMIN'   => '5',
        'OFFICER' => '1',
        'RECEPTIONIST' => '2',
        'CLIENT'  => '3',
        'IT ASSISTANT'   => '6'
    ];

    public function hasRole($role)
    {  
        return ($this->user_type == $this->avaliableRoles[strtoupper($role)]);
    } 

    public function role()
    {  
        $roles = array_flip($this->avaliableRoles);
        return $roles[$this->user_type];
    } 

    public function roles($user_type = null)
    {   
        $roles = array_flip($this->avaliableRoles);
        $list = $roles;
        unset($list['1']); 
        unset($list['2']); 
        unset($list['3']); 

        return (!empty($user_type)?($roles[$user_type]):$list);
    } 

    public function accounts()
    {
	    return $this->hasMany('App\Models\UserSocialAccount');
	}

    public function department() 
    {
        return $this->hasOne('App\Models\Department', 'id', 'department_id');
    }

}
