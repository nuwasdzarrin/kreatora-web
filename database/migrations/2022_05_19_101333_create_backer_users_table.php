<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBackerUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('backer_users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('index')->nullable();
            $table->unsignedInteger('campaign_id')->nullable();
            $table->unsignedInteger('user_id')->nullable();
            $table->unsignedInteger('reward_id')->nullable();
            $table->double('amount')->nullable();
            $table->double('tip')->nullable();
            $table->boolean('is_anonymous')->nullable()->default(false);
            $table->timestamps();

            $table->foreign('campaign_id')->references('id')
                ->on('campaigns')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('user_id')->references('id')
                ->on('users')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('reward_id')->references('id')
                ->on('rewards')->onUpdate('cascade')->onDelete('set null');
                
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('backer_users');
    }
}
