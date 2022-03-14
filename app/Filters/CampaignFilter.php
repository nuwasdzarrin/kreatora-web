<?php

namespace App\Filters;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;

/**
 * CampaignFilter Filter
 */
class CampaignFilter extends BaseFilter
{
    /**
     * Searchable Field,
     * support relation also, ex: [ 'name', 'posts' => [ 'title' ] ]
     * @var array
     */
    protected $searchables = [
        'id',
        'campaign_category_id',
        'title'
    ];

    /**
     * Sortables Field
     * support relation but belongsTo morhpTo hasOne morphOne only, ex: [ 'id', 'name', 'role.name' ]
     * @var array
     */
    protected $sortables = [
        'id',
        'name',
        'created_at',
        'updated_at'
    ];

    /**
     * Default Sort, null if no default, ex: 'name,asc'
     * @var string|null
     */
    protected $default_sort = 'id,desc';

    /**
     * Default per page, null if use model per page default, ex: 20
     * @var int|null
     */
    protected $default_per_page = null;

    public function type($value)
    {
        $validator = validator([ 'value' => $value ], [ 'value' => 'string' ]);
        return $this->builder->when(!$validator->fails() && $value, function (Builder $query) use($value) {
            return $query->when($value == 'latest', function (Builder $builder) {
                return $builder->latest($builder->qualifyColumn('created_at'));
            })->when($value == 'will_end', function (Builder $builder) {
                return $builder->whereNotNull('end')
                    ->whereBetween('end', [Carbon::now(), Carbon::now()->addYears(2)])
                    ->orderBy('end', 'asc');
            });
        });
    }
}
