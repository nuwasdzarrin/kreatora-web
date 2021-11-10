<?php

namespace App;

use Illuminate\Database\Eloquent\SoftDeletes;
use Smartisan\Filters\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

/**
 * Wallet Model
 */
class Wallet extends Model
{
    use Filterable, SoftDeletes;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\WalletFilter';

    /** @var string $table */
    //protected $table = '';

    /** @var string $primaryKey */
    //protected $primaryKey = '';

    /** @var bool $incrementing */
    //public $incrementing = false;

    /** @var string $keyType */
    //protected $keyType = 'string';

    /** @var bool $timestamps */
    //public $timestamps = false;

    /** @var string $dateFormat */
    //protected $dateFormat = 'U';

    /** @var string CREATED_AT */
    //const CREATED_AT = '';
    /** @var string UPDATED_AT */
    //const UPDATED_AT = '';

    /** @var string $connection */
    //protected $connection = '';

    protected $hidden = ['uuid','status', 'user'];
    protected $appends = ['user_name'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function wallet_histories()
    {
        return $this->hasMany(WalletHistory::class);
    }

    public function getUserNameAttribute()
    {
        return $this->user ? $this->user->name : null;
    }
}
