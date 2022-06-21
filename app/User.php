<?php

namespace App;

use Atnic\LaravelGenerator\Traits\HasExtendedAttributes;
use App\Traits\ResolveRouteBindingWithFilter;
use Atnic\LaravelGenerator\Traits\SetterGetterExtendedAttribute;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Smartisan\Filters\Traits\Filterable;

class User extends \TCG\Voyager\Models\User
{
    use HasApiTokens, Notifiable, SoftDeletes;
    use Filterable, HasExtendedAttributes, ResolveRouteBindingWithFilter, SetterGetterExtendedAttribute;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\UserFilter';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'google_id', 'email_verified_at'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'role',
    ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    protected $appends = [
        'role_name'
    ];

    public function campaigns()
    {
        return $this->hasMany(Campaign::class);
    }

    public function campaign_comments()
    {
        return $this->hasMany(CampaignComment::class);
    }

    public function backer_users()
    {
        return $this->hasMany(BackerUser::class);
    }
    public function payments()
    {
        return $this->hasMany(Payment::class);
    }

    public function wallet()
    {
        return $this->hasOne(Wallet::class);
    }

    public function wallet_histories()
    {
        return $this->hasMany(WalletHistory::class);
    }

    public function getRoleNameAttribute()
    {
        return $this->role ? $this->role->display_name : null;
    }
}
