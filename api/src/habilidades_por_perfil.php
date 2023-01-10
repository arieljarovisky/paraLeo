<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);

$sql = $dbConn->prepare("SELECT description, id, soft_habilities FROM habilities");
$sql->execute();
$sql->setFetchMode(PDO::FETCH_ASSOC);
header("HTTP/1.1 200 OK");
echo json_encode( $sql->fetchAll());