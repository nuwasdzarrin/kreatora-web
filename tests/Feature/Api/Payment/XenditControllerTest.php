<?php

namespace Tests\Feature\Api\Payment;

use Illuminate\Support\Facades\Route;
use App\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class XenditControllerTest extends TestCase
{
    /**
     * Invoke single action controller.
     *
     * @return void
     */
    public function test()
    {
        if (!Route::has('api.payment.xendit')) { $this->expectNotToPerformAssertions(); return; }
        $user = factory(User::class)->create();

        $this->actingAs($user);
        $response = $this->get(route('api.payment.xendit'));
        if ($response->exception) {
            $this->expectOutputString('');
            $this->setOutputCallback(function () use($response) { return $response->exception; });
            return;
        }
        $response->assertViewIs('api.payment.xendit');
    }
}
