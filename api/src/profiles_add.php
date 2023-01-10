<?php
include('config/config2.php');
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);

$puesto = $_POST['name'];
$bio = $_POST['bio'];
$id_seniority = $_POST['seniority'];
$query = "INSERT INTO `profiles`(`id`,`description`, `company`, `information`, `id_seniority`, `created_at`) VALUES (UUID(),'{$puesto}','Eldar','{$bio}', '{$id_seniority}', current_timestamp())";
$result = mysqli_query($connection, $query);

if (!$result) {
    die('Query Failed.');
}





$sql = $dbConn->prepare("SELECT id from profiles order by created_at DESC limit 1");
$sql->execute();
header("HTTP/1.1 200 OK");
$perfil =  $sql->fetch(PDO::FETCH_ASSOC);
$id_perfil = $perfil['id'];

$habilidades =  implode(', ', array_column(json_decode($_POST['tags']), 'value'));


$habilidades_array = explode(", ", $habilidades);

for ($i = 0; $i < count($habilidades_array); $i++) {
    
    $sql = $dbConn->prepare("SELECT id from habilities where description = '{$habilidades_array[$i]}'");
    $sql->execute();
    $sql->setFetchMode(PDO::FETCH_ASSOC);
    header("HTTP/1.1 200 OK");
    $id_habilities_array = $sql->fetch();
    $id_habilities = $id_habilities_array['id'];

    echo $id_habilities;

    $query = "INSERT INTO `profiles_habilities`(`id`,`id_profile`, `id_habilities`, `created_at`) VALUES (UUID(),'{$id_perfil}','{$id_habilities}', current_timestamp())";
    $result = mysqli_query($connection, $query); 
    
 if (!$result) {
        die('Query Failed.');
    }


}


 


  




echo "Perfil agregado correctamente";
