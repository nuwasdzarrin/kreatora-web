<?php

use Illuminate\Database\Seeder;
use TCG\Voyager\Models\Role;
use TCG\Voyager\Models\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        $role = Role::where('name', 'admin')->firstOrFail();

        $user = \App\User::query()->where('email', 'admin@admin.com')->first();
        if (!$user) {
            User::create([
                'name'           => 'Admin',
                'email'          => 'admin@admin.com',
                'password'       => bcrypt('password'),
                'remember_token' => str_random(60),
                'role_id'        => $role->id,
            ]);
        }

        $user = \App\User::query()->where('email', 'kreator@gmail.com')->first();
        if (!$user) {
            User::create([
                'name'           => 'Kreator',
                'email'          => 'kreator@gmail.com',
                'password'       => bcrypt('password'),
                'remember_token' => str_random(60),
                'role_id'        => 2,
            ]);
        }

        $user = \App\User::query()->where('email', 'baker@gmail.com')->first();
        if (!$user) {
            User::create([
                'name'           => 'Baker',
                'email'          => 'baker@gmail.com',
                'password'       => bcrypt('password'),
                'remember_token' => str_random(60),
                'role_id'        => 2,
            ]);
        }

    }
}
