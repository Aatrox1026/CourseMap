<?php

$table = "mapping_field_department_course";

switch($_SERVER['REQUEST_METHOD']) {
//case 'GET':

case 'POST':
    $data = (array)json_decode(trim(file_get_contents('php://input'),"[]"));
    $result = Insert($data);

    http_response_code($result['code']);
    echo json_encode($result['value']);
//case 'PATCH':

case 'DELETE':
}

function Select() {

}

function Insert() {

}

function Update() {

}

function Delete() {

}

?>