


<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);


if (isset($_GET['id'])) {

  $sql = $dbConn->prepare("SELECT ph.id_profile, sr.id as 'id_seniority', sr.description as 'seniority', pr.description as 'Perfil', hb.description as 'Habilidad', pr.information  FROM `profiles_habilities` ph
  JOIN profiles pr on pr.id=ph.id_profile
  join habilities hb on hb.id=ph.id_habilities
  JOIN seniority sr on sr.id = pr.id_seniority 
  WHERE pr.id=:id");
  $sql->bindValue(':id', $_GET['id']);
  $sql->execute();
  header("HTTP/1.1 200 OK");
  echo json_encode($sql->fetchAll(PDO::FETCH_ASSOC));
  exit();
}
