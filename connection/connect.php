<?php

$conn_IP = "localhost";
$conn_userName = "Aatrox";
$conn_passwd = "knnn4848";
$conn_db = "coursemap";

$sql = new mysqli($conn_IP,$conn_userName,$conn_passwd,$conn_db);
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    echo mysqli_connect_error();
    exit();
}