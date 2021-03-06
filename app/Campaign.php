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

    protected $hidden = ['user','backer_users', 'campaign_category'];

    /**
     * @var array
     */
    protected $casts = [
        'images' => 'array',
    ];

    protected $appends = ['category_name', 'creator_name','creator_avatar','total_backer','total_funded'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function backer_users()
    {
        return $this->hasMany(BackerUser::class)->with(['user']);
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

    public function campaign_category()
    {
        return $this->belongsTo(CampaignCategory::class);
    }

    public function getCategoryNameAttribute()
    {
        return $this->campaign_category ? $this->campaign_category->name : null;
    }

    public function getCreatorNameAttribute()
    {
        return $this->user?$this->user->name:null;
    }

    public function getCreatorAvatarAttribute()
    {
        return $this->user ? $this->user->avatar : null;
    }

    public function getBackersAvatarAttribute()
    {
        if (!$this->backer_users) return null;
        $result = [];
        $this->backer_users->take(-3)->each(function ($backer) use (&$result) {
            array_push($result, $backer->user->avatar);
        });
        return $result;
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
