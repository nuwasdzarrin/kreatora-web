<?php

namespace App;

use Atnic\LaravelGenerator\Traits\HasExtendedAttributes;
use App\Traits\ResolveRouteBindingWithFilter;
use Atnic\LaravelGenerator\Traits\SetterGetterExtendedAttribute;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Smartisan\Filters\Traits\Filterable;

class User extends \TCG\Voyager\Models\User
{
    use HasApiTokens, Notifiable;
    use Filterable, HasExtendedAttributes, ResolveRouteBindingWithFilter, SetterGetterExtendedAttribute;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\CategoryFilter';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}