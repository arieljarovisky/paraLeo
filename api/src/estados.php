<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);



  $sql = $dbConn->prepare("SELECT * from status");
  $sql->execute();
  header("HTTP/1.1 200 OK");
  echo json_encode(  $sql->fetchAll(PDO::FETCH_ASSOC)  );
  exit();
