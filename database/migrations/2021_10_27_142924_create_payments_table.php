<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('backer_user_id')->nullable();
            $table->string('owner_id')->nullable();
            $table->string('external_id')->nullable();
            $table->string('name')->nullable();
            $table->string('account_number')->nullable();
            $table->string('bank_code')->nullable();
            $table->double('amount')->nullable();
            $table->string('channel')->nullable();
            $table->string('status')->nullable();
            $table->text('noted')->nullable();
            $table->timestamp('expiration_date')->nullable();
            $table->timestamp('transaction_time')->nullable();
            $table->timestamps();

            $table->foreign('backer_user_id')->references('id')
                ->on('backer_users')->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('payments');
    }
}
