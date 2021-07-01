<?php

$table = "Reference";

if($_SERVER['REQUEST_METHOD'] === 'GET'){//GET(SELECT),POST(INSERT),DELETE(DELETE),PATCH(UPDATE)
    $result = Select($route->getParameter(2), $route->getParameter(3));
    
    http_response_code($result['code']);
    echo json_encode($result['value']);
    
}
else if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $data = (array)json_decode(trim(file_get_contents('php://input'),"[]")) ;
    $result = Insert($data);

    http_response_code($result['code']);
    echo json_encode($result['value']);
    
}
else if($_SERVER['REQUEST_METHOD'] === 'PATCH'){
    $_PATCH =  (array)json_decode(trim(file_get_contents('php://input'),"[]")) ;
    $id = $route->getParameter(2);
    $result = Update($_PATCH,$id);

    http_response_code($result['code']);
    echo json_encode($result['value']);
}
else if($_SERVER['REQUEST_METHOD'] === 'DELETE'){
    if($route->getParameter(2)!=''){
        $where = "id = ".$route->getParameter(2);
        $result = Delete($where);
        
        http_response_code($result['code']);
        echo json_encode($result['value']);
    }
    else{
        http_response_code(400);
        echo "please input id";
    }
    
}

function Select($cid){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = [];
    $index = 0;

    $ridSet = implode(",", GetRefId($cid));
    $query = "select * from $table where id in ($ridSet);";
    $result = $sql->query($query);
    
    if(!$result) {
        $response['value'] = $sql->error;
        $response['code']=400;
        return $response;
    }
    while($row = $result->fetch_assoc()){
        $response['value'][$index] = $row;
        $index++;
    }
    if($index == 0){
        $response['code']=404;
        $response['value'] = "reference not found";
    }
    
    return $response;
}

function Insert($data){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = '';
    
    return $response;
}

function Update($data,$id){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = '';
    
    return $response;
}

function Delete($where){
    global $sql;
    global $table;
    $response['code'] = 200;
    $response['value'] = '';
    
    return $response;
}

function GetRefId($cid) {
    global $sql;
    
    $query = "select rid from mapping_course_reference where cid = $cid;";
    $result = $sql->query($query);

    $resultSet = array();
    while($row = mysqli_fetch_array($result))
        $resultSet[] = $row['rid'];

    return $resultSet;
}