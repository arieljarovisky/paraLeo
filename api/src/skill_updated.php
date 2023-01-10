
<?php 

include('config/config.php');
include "utils.php";
$dbConn =  connect($db);

if (isset($_POST['id'])) {
  //Mostrar un post
  $sql = $dbConn->prepare("UPDATE `habilities` SET `description`='{$_POST['habilidad']}',`soft_habilities`='{$_POST['toggle']}' WHERE id = :id");
  $sql->bindValue(':id', $_POST['id']);
  $sql->execute();
  header("HTTP/1.1 200 OK");
  echo json_encode($sql->fetchAll(PDO::FETCH_ASSOC));
  exit();
}
