<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Http\Resources\Json\Resource;
use Kavist\RajaOngkir\Facades\RajaOngkir;

/**
 * ShippingController
 */
class ShippingController extends Controller
{
    /**
    * Instantiate a new controller instance.
    *
    * @return void
    */
    public function __construct()
    {
//        $this->middleware('auth:api');
    }

    public function province(Request $request)
    {
        $request->validate([
            'search' => 'required|string'
        ]);
        $result = RajaOngkir::provinsi()->search($request->search)->get();
        return response()->json($result, 200);
    }

    public function city(Request $request)
    {
        $request->validate([
            'search' => 'required|string'
        ]);
        $result = RajaOngkir::kota()->search($request->search)->get();
        return response()->json($result, 200);
    }

    public function subdistrict(Request $request)
    {
        $request->validate([
            'search' => 'required|string'
        ]);
        $result = RajaOngkir::subdistrict()->search($request->search)->get();
        return response()->json($result, 200);
    }

    public function cost(Request $request)
    {
        $request->validate([
            'origin' => 'required|numeric',
            'destination' => 'required|numeric',
            'weight' => 'required|numeric',
            'courier' => 'required|string',
        ]);
        $result = RajaOngkir::ongkosKirim([
            'origin'        => $request->origin,     // ID kota/kabupaten asal
            'destination'   => $request->destination,// ID kota/kabupaten tujuan
            'weight'        => $request->weight,    // berat barang dalam gram
            'courier'       => $request->courier    // kode kurir pengiriman: ['jne', 'tiki', 'pos'] untuk starter
        ])->get();
        return response()->json($result, 200);
    }


}
