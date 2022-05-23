<?php

return [
    'mercant_id' => env('MIDTRANS_MERCHANT_ID',''),
    'client_key' => env('MIDTRANS_CLIENT_KEY',''),
    'server_key' => env('MIDTRANS_SERVER_KEY','SB-Mid-server-EQcEwgyjU51i4k3YOH8UDfFg'),

    'is_production' => env('MIDTRANS_IS_PRODUCTION',false),
    'is_sanitized' => false,
    'is_3ds' => false,
];
