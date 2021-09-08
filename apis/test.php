<?php

if($_SERVER['REQUEST_METHOD'] === 'GET'){//GET(SELECT),POST(INSERT),DELETE(DELETE),PATCH(UPDATE)
    $data = (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $jwt = new Jwt;
    $result = array();
    $result['code'] = 200;
    $result['value'] = $jwt->GetToken($data);
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
}
if($_SERVER['REQUEST_METHOD'] === 'POST'){//GET(SELECT),POST(INSERT),DELETE(DELETE),PATCH(UPDATE)
    $token = getBearerToken();
    $jwt = new Jwt;
    $result = array();
    $result['code'] = 200;
    $result['value'] = $jwt->VerifyToken($token);
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
}

?>