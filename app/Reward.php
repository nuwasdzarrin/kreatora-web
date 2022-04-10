<?php

namespace App;

use Smartisan\Filters\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

/**
 * Reward Model
 */
class Reward extends Model
{
    use Filterable;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\RewardFilter';

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

    protected $hidden = ['backer_users'];

    protected $appends = [
        'backer_count', 
        // 'backer_remaining_quota'
    ];

    public function campaign()
    {
        return $this->belongsTo(Campaign::class);
    }
    
    public function backer_users()
    {
        return $this->hasMany(BackerUser::class);
    }

    public function getBackerCountAttribute()
    {
        return $this->backer_users->count();
    }

    // public function getBackerRemainingQuotaAttribute()
    // {
    //     return $this->max_backer ? (($this->max_backer) - ($this->getBackerCountAttribute() ?? 0)) : '~';
    // }
}
