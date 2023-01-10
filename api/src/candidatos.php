



<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);


if (isset($_GET['id'])) {
  //Mostrar un post
  $sql = $dbConn->prepare("Select c.email, c.first_name, c.last_name,c.file_name,c.id, st.description as 'estado', prv.name as 'provincia' ,  prf.description as 'perfil' from Candidates c
  join Profiles prf on prf.id = c.id_profile
  JOIN status st ON st.id = c.id_status
  join provinces prv on prv.id = c.id_province
  WHERE prf.id=:id");
  $sql->bindValue(':id', $_GET['id']);
  $sql->execute();
  header("HTTP/1.1 200 OK");
  echo json_encode($sql->fetchAll(PDO::FETCH_ASSOC));
  exit();
}
