<?php

namespace App;

use App\Traits\ResolveRouteBindingWithFilter;
use Illuminate\Database\Eloquent\SoftDeletes;
use Smartisan\Filters\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

/**
 * Campaign Model
 */
class Campaign extends Model
{
    use Filterable, SoftDeletes, ResolveRouteBindingWithFilter;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\CampaignFilter';

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

    protected $hidden = ['user','backer_users'];

    /**
     * @var array
     */
    protected $casts = [
        'images' => 'array',
    ];

    protected $appends = ['creator_name','total_backer','total_funded'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function backer_users()
    {
        return $this->hasMany(BackerUser::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function faqs()
    {
        return $this->hasMany(Faq::class);
    }

    public function rewards()
    {
        return $this->hasMany(Reward::class);
    }

    public function updates()
    {
        return $this->hasMany(Update::class);
    }

    public function campaign_comments()
    {
        return $this->hasMany(CampaignComment::class)->whereNull('parent_id');
    }

    public function getCreatorNameAttribute()
    {
        return $this->user?$this->user->name:null;
    }

    public function getTotalBackerAttribute()
    {
        return $this->backer_users->count();
    }

    public function getTotalFundedAttribute()
    {
        return $this->backer_users->sum(function ($item) {
            return $item['amount'] + $item['tip'];
        });
    }
}
