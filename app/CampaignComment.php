<?php

namespace App;

use Smartisan\Filters\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

/**
 * CampaignComment Model
 */
class CampaignComment extends Model
{
    use Filterable;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\CampaignCommentFilter';

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

    protected $guarded = [];

    protected $hidden = ['user'];

    protected $appends = ['user_avatar', 'user_name'];

    public function childs()
    {
        return $this->hasMany(CampaignComment::class, 'parent_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getUserAvatarAttribute()
    {
        return $this->user ? $this->user->avatar : '';
    }

    public function getUserNameAttribute()
    {
        return $this->user ? $this->user->name : '';
    }
}
