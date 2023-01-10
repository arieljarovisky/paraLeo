<?php 

include('config/config2.php');


$abilitie = json_decode($_POST['tags-jquery']);


for ($i=0; $i <count($abilitie) ; $i++) { 
 
$query = "INSERT INTO `habilities`(`id`, `description`, `soft_habilities`) VALUES (UUID(),'{$abilitie[$i]->value}', 0)";
$result = mysqli_query($connection, $query);

if (!$result) {
    die('Query Failed.');
}
}
echo "Habilidades agregada correctamente";
