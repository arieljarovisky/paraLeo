<?php
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);
if (isset($_GET['id'])) {
$sql = $dbConn->prepare("SELECT pr.id, pr.description as 'Nombre_perfil', pr.company, sr.description as 'seniority' FROM `profiles` pr
join seniority sr on pr.id_seniority = sr.id WHERE  pr.id != :id LIMIT 3");
$sql->bindValue(':id', $_GET['id']);
$sql->execute();
$sql->setFetchMode(PDO::FETCH_ASSOC);
header("HTTP/1.1 200 OK");
echo json_encode( $sql->fetchAll()  );

}
