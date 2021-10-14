<?php

use Illuminate\Database\Seeder;
use App\CampaignCategory;
use Carbon\Carbon;

class CampaignCategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $campaign_categories = CampaignCategory::query()->count();
        if (!$campaign_categories) {
            CampaignCategory::query()->insert([
                [
                    'name'=>'technology',
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ],
                [
                    'name'=>'game',
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ],
                [
                    'name'=>'art',
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ],
            ]);
        }
    }
}
