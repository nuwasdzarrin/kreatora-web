<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFaqsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('faqs', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('campaign_id');
            $table->unsignedInteger('user_question_id')->nullable();
            $table->unsignedInteger('user_answer_id')->nullable();
            $table->string('question');
            $table->string('answer')->nullable();
            $table->timestamps();

            $table->foreign('campaign_id')->references('id')
                ->on('campaigns')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('user_question_id')->references('id')
                ->on('users')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('user_answer_id')->references('id')
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
        Schema::dropIfExists('faqs');
    }
}
