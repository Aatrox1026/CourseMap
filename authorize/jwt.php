<?php

class Jwt {
    private static $header = array('alg' => 'HS512', 'typ' => 'JWT');
    private static $key = 'coursemap';

    public static function GetToken(array $payload) {
        if(is_array($payload)) {
            $base64header = self::Base64UrlEncode(json_encode(self::$header, JSON_UNESCAPED_UNICODE));
            $base64payload = self::Base64UrlEncode(json_encode($payload, JSON_UNESCAPED_UNICODE));
            $token = $base64header.'.'.$base64payload.'.'.self::Signature(self::$key, $base64header.'.'.$base64payload, self::$header['alg']);
            return $token;
        }
        else {
            return false;
        }
    }

    public static function VerifyToken(string $token) {
        $tokens = explode('.', $token);
        if(count($tokens) != 3)
            return false;

        list($base64header, $base64payload, $signature) = $tokens;

        $header = json_decode(self::Base64UrlDecode($base64header), JSON_OBJECT_AS_ARRAY);
        $payload = json_decode(self::Base64UrlDecode($base64payload), JSON_OBJECT_AS_ARRAY);

        if(empty($header['alg']))
            return false;

        if(self::Signature(self::$key, $base64header.'.'.$base64payload, $header['alg']) != $signature)
            return false;

        return $payload;
    }

    private static function Base64UrlEncode(string $input) {
        return str_replace('=', '', strtr(base64_encode($input), '+/', '-_'));
    }

    private static function Base64UrlDecode(string $input) {
        $addlen = (4 - (strlen($input) % 4)) % 4;
        $input .= str_repeat('=', $addlen);

        return base64_decode(strtr($input, '-_', '+/'));
    }

    private static function Signature(string $key, string $input, string $alg) {
        $alg_config = array(
            'HS512' => 'sha512'
        );

        return self::Base64UrlEncode(hash_hmac($alg_config[$alg], $input, $key, true));
    }
}

/**
* get access token from header
* */
function getBearerToken() {
    $headers = getAuthorizationHeader();
    // HEADER: Get the access token from the header
    if (!empty($headers)) {
        if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
            return $matches[1];
        }
    }
    return null;
}

function getAuthorizationHeader(){
    $headers = null;
    if (isset($_SERVER['Authorization'])) {
        $headers = trim($_SERVER["Authorization"]);
    }
    else if (isset($_SERVER['HTTP_AUTHORIZATION'])) { //Nginx or fast CGI
        $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
    } elseif (function_exists('apache_request_headers')) {
        $requestHeaders = apache_request_headers();
        // Server-side fix for bug in old Android versions (a nice side-effect of this fix means we don't care about capitalization for Authorization)
        $requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
        //print_r($requestHeaders);
        if (isset($requestHeaders['Authorization'])) {
            $headers = trim($requestHeaders['Authorization']);
        }
    }
    return $headers;
}

?>