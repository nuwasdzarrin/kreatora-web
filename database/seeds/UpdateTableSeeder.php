<?php

use Illuminate\Database\Seeder;

class UpdateTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(\App\Update::class, 10)->create();
    }
}
