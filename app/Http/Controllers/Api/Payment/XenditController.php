<?php

namespace App\Http\Controllers\Api\Payment;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Xendit\VirtualAccounts;
use Xendit\Xendit;

/**
 * XenditController
 */
class XenditController extends Controller
{
    private $api_key;
    /**
    * Instantiate a new controller instance.
    *
    * @return void
    */
    public function __construct()
    {
        $this->api_key = config('payment.xendit.api_key');
        $this->middleware('auth:api');
    }

    public function virtual_accounts()
    {
        Xendit::setApiKey($this->api_key);
        $va_banks = VirtualAccounts::getVABanks();
        return response()->json([
            'data' => $va_banks
        ])->setStatusCode(200);
    }

    public function create_virtual_accounts(Request $request)
    {
        $request->validate([
            'bank_code' => 'required|string',
            'price' => 'required|numeric'
        ]);
        Xendit::setApiKey($this->api_key);
        $params = [
            "external_id" => uniqid(),
            "bank_code" => $request->bank_code,
            "name" => auth()->user()->name,
            "expected_amount" => $request->price,
            "expiration_date" => Carbon::now()->addDays(1)->toISOString(),
            "is_closed" => true,
            "is_single_use" => true
        ];

        $createVA = VirtualAccounts::create($params);
        return response()->json([
            'data' => $createVA
        ])->setStatusCode(200);
    }

    public function callback_virtual_account(Request $request)
    {
        $req = implode("  ", $request->all());
        $data = DB::table('randoms')->insert(
            ['content' => $req]
        );
        return response()->json([
            'data' => $data
        ])->setStatusCode(200);
    }
}
