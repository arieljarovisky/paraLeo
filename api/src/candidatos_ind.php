<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);


if (isset($_GET['id'])) {
  //Mostrar un post
  $sql = $dbConn->prepare("SELECT cts.id, last_name as 'Apellido',first_name as 'Nombre',ps.description as 'Perfil',hs.description as 'Skills',birth_date as 'Fecha_de_nacimiento',cts.description as 'Descripcion_del_candidato', status.description as 'Estado',provinces.name as 'Provincia',phone as 'Telefono',email as 'Email',file_name as 'CV',cts.challenge_link as 'Link de challenge' FROM candidatos.candidates cts
  join status on status.id = cts.id_status
  join provinces	on provinces.id = cts.id_province
  join profiles ps on ps.id = cts.id_profile
  join profiles_habilities ph on ph.id_profile = ps.id
  join habilities hs on ph.id_habilities = hs.id
  WHERE cts.deleted_at IS NULL AND cts.id=:id");
  $sql->bindValue(':id', $_GET['id']);
  $sql->execute();
  header("HTTP/1.1 200 OK");
  echo json_encode($sql->fetchAll(PDO::FETCH_ASSOC));
  exit();
}
