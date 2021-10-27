<?php

namespace App\Http\Controllers\Api\Payment;

use App\Payment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Xendit\VirtualAccounts;
use Xendit\Xendit;

/**
 * XenditController
 */
class XenditController extends Controller
{
    private $api_key, $xenditXCallbackToken;
    /**
    * Instantiate a new controller instance.
    *
    * @return void
    */
    public function __construct()
    {
        $this->api_key = config('payment.xendit.api_key');
        $this->xenditXCallbackToken = config('payment.xendit.callback_token');
        $this->middleware('auth:api')->except(['callback_virtual_accounts']);
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
            'backer_user_id' => 'required|exists:backer_users,id',
            'bank_code' => 'required|string',
            'price' => 'required|numeric'
        ]);
        Xendit::setApiKey($this->api_key);
        $params = [
            "external_id" => uniqid().'va'.$request->backer_user_id,
            "bank_code" => $request->bank_code,
            "name" => auth()->user()->name,
            "expected_amount" => $request->price,
            "expiration_date" => Carbon::now()->addDays(1)->toISOString(),
            "is_closed" => true,
            "is_single_use" => true
        ];
        $va = VirtualAccounts::create($params);

        $payment = new Payment;
        $payment->backer_user_id = $request->backer_user_id;
        $payment->owner_id = $va['owner_id'];
        $payment->external_id = $va['external_id'];
        $payment->name = $va['name'];
        $payment->account_number = $va['account_number'];
        $payment->bank_code = $va['bank_code'];
        $payment->amount = $va['expected_amount'];
        $payment->expiration_date = Carbon::parse($va['expiration_date'])->format('Y-m-d H:i:s');
        $payment->channel = "virtual_account";
        $payment->status = $va['status'];
        $payment->save();

        return response()->json([
            'data' => $va
        ])->setStatusCode(200);
    }

    public function callback_virtual_accounts(Request $request)
    {
        $headers = getallheaders();
        $xIncomingCallbackTokenHeader = $headers['x-callback-token'] ?? "";
        if($xIncomingCallbackTokenHeader === $this->xenditXCallbackToken){
            $payment = Payment::query()->where('external_id', $request->external_id)->first();
            $payment->transaction_time = Carbon::parse($request->transaction_timestamp)->format('Y-m-d H:i:s');
            $payment->status = 'PAID';
            $payment->save();

            return response()->json([
                'message' => 'callback success'
            ], 200);
        }

        return response()->json([
            'message' => 'wrong callback token'
        ], 401);
    }
}
