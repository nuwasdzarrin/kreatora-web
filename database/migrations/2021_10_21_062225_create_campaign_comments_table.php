<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampaignCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campaign_comments', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('parent_id')->nullable();
            $table->unsignedInteger('campaign_id')->nullable();
            $table->unsignedInteger('user_id')->nullable();
            $table->string('content');
            $table->timestamps();

            $table->foreign('parent_id')->references('id')
                ->on('campaign_comments')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('campaign_id')->references('id')
                ->on('campaigns')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('user_id')->references('id')
                ->on('users')->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('campaign_comments');
    }
}
