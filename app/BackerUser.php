<?php

namespace App;

use Smartisan\Filters\Traits\Filterable;
use Illuminate\Database\Eloquent\Model;

/**
 * BackerUser Model
 */
class BackerUser extends Model
{
    use Filterable;

    /** @var string Filter Class */
    protected $filters = 'App\Filters\BackerUserFilter';

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

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function reward()
    {
        return $this->belongsTo(Reward::class);
    }
}
