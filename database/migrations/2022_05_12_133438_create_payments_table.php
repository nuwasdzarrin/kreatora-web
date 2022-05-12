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
            $table->unsignedInteger('order_id')->nullable();
            $table->unsignedInteger('status_code')->nullable();
            $table->string('status')->nullable();
            $table->string('email')->nullable();
            $table->double('amount')->nullable();
            $table->text('payment_link')->nullable();
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
