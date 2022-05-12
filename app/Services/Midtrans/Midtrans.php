<?php
 
namespace App\Services\Midtrans;


use Midtrans\Config as MidConfig;
 
class Midtrans {
    protected $serverKey;
    protected $isProduction;
    protected $isSanitized;
    protected $is3ds;
 
    public function __construct()
    {
        $this->serverKey = config('midtrans.server_key');
        $this->isProduction = config('midtrans.is_production');
        $this->isSanitized = config('midtrans.is_sanitized');
        $this->is3ds = config('midtrans.is_3ds');
 
        $this->_configureMidtrans();
    }
 
    public function _configureMidtrans()
    {

        MidConfig::$serverKey = 'Mid-server-gBIgM9uBSAGg7sNQGk4rygFE';
        MidConfig::$isProduction = false;
        MidConfig::$isSanitized = true;
        MidConfig::$is3ds = true;
    }
}