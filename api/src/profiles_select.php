<?php
include "config/config.php";
include "utils.php";

$dbConn =  connect($db);

      //Mostrar lista de post
      $sql = $dbConn->prepare("SELECT id, description as 'Nombre_perfil' from profiles");
      $sql->execute();
      $sql->setFetchMode(PDO::FETCH_ASSOC);
      header("HTTP/1.1 200 OK");
      echo json_encode( $sql->fetchAll()  );
      exit();
