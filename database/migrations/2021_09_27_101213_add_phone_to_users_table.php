<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPhoneToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->timestamp('email_verified_at')->nullable()->after('remember_token');
            $table->string('phone')->nullable()->after('settings');
            $table->string('address')->nullable()->after('phone');
            $table->string('latitude')->nullable()->after('address');
            $table->string('longitude')->nullable()->after('latitude');
            $table->enum('gender', ['male', 'female', 'prefer_not_to_tell'])->nullable()->after('longitude');
            $table->string('bank_account')->nullable()->after('gender');
            $table->string('ktp')->nullable()->after('bank_account');
            $table->string('fcm_token')->nullable()->after('ktp');
        });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn([
                'phone', 'address', 'latitude', 'longitude', 'gender', 'bank_account', 'ktp', 'fcm_token'
            ]);
        });
    }
}
