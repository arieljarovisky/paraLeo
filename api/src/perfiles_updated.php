<?php
include('config/config2.php');
include('config/config.php');
include "utils.php";
$dbConn =  connect($db);

$puesto = $_POST['name'];
$bio = $_POST['bio'];
$id_seniority = $_POST['seniority'];
$query = "UPDATE `profiles` SET `description`='{$puesto}',`information`='{$bio}',`id_seniority`='{$id_seniority}' WHERE id = '{$_POST['id']}'";
$result = mysqli_query($connection, $query);

if (!$result) {
    die('Query Failed.');
}


$habilidades =  implode(', ', array_column(json_decode($_POST['tags']), 'value'));



$habilidades_array = explode(", ", $habilidades);






for ($i = 0; $i < count($habilidades_array); $i++) {

    $sql1 = $dbConn->prepare("SELECT id from habilities where description = '{$habilidades_array[$i]}'");
    $sql1->execute();
    $id_habilities_array =  $sql1->fetch(PDO::FETCH_ASSOC);


    $id_habilities = $id_habilities_array['id'] . ',';


    $array_habiliades = explode(",", $id_habilities);

   

    $total = mysqli_num_rows(mysqli_query($connection, "SELECT * FROM profiles_habilities WHERE id_habilities='$id_habilities' AND id_profile='{$_POST['id']}'"));

    echo $total;

            if ($total == 0) {
        $query = "UPDATE `profiles_habilities` SET `id_habilities`='{$id_habilities}'  WHERE id_profile = '{$_POST['id']}'";
        $result = mysqli_query($connection, $query);
    } else {
        $query = "INSERT INTO `profiles_habilities`(`id`,`id_profile`, `id_habilities`, `created_at`) VALUES (UUID(),'{$_POST['id']}','{$id_habilities}', current_timestamp())";
        $result = mysqli_query($connection, $query);
    }


    if (!$result) {
        die('Query Failed.');
    }
}










echo "Perfil actualizado correctamente";
