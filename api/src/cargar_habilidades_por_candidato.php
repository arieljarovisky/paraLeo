<?php 

include('config/config2.php');
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);



 
$abilitie = json_decode($_POST['tags']);


for ($i=0; $i <count($abilitie) ; $i++) { 
$sql = $dbConn->prepare("SELECT id from habilities where habilities.description = '{$abilitie[$i]->value}'");
$sql->execute();
$sql->setFetchMode(PDO::FETCH_ASSOC);
header("HTTP/1.1 200 OK");
echo json_encode( $sql->fetchAll());

echo $sql[$i]->id;
   
/* $query = "INSERT INTO `habilty_per_candidate`(`id`, `id_candidate`, `id_habilities`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES (UUID(),{$_POST['id']},'[value-3]','[value-4]','[value-5]','[value-6]','[value-7]')";
$result = mysqli_query($connection, $query); */

if (!$result) {
    die('Query Failed.');
}
}
echo "Habilidades agregada correctamente";
