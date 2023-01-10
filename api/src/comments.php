<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);


if (isset($_GET['id']))
{

  $sql = $dbConn->prepare("SELECT c.id, cts.comment, eu.first_name AS eldar_nombre, eu.last_name as eldar_apellido, fu.first_name as fiserv_nombre, fu.last_name as fiserv_apellido, cts.date, eu.picture, c.first_name, c.last_name FROM comments cts left join eldar_users eu on eu.id = cts.id_user_eldar left join fiserv_users fu on fu.id = cts.id_user_fiserv join candidates c on c.id = cts.id_candidate WHERE id_candidate=:id ORDER by cts.date desc ");
  $sql->bindValue(':id', $_GET['id']);
  $sql->execute();
  header("HTTP/1.1 200 OK");
  echo json_encode(  $sql->fetchAll(PDO::FETCH_ASSOC)  );
  exit();
  }




  