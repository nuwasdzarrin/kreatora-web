<?php

use Illuminate\Database\Seeder;

class CampaignCommentTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(\App\CampaignComment::class, 10)->create();
    }
}
