<?php
include "config/config.php";
include "utils.php";

$dbConn =  connect($db);

      //Mostrar lista de post
      $sql = $dbConn->prepare("SELECT id, description from seniority");
      $sql->execute();
      $sql->setFetchMode(PDO::FETCH_ASSOC);
      header("HTTP/1.1 200 OK");
      echo json_encode( $sql->fetchAll()  );
      exit();
