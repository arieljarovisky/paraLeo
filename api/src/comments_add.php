

<?php
include('config/config2.php');


$id_user_eldar = $_POST['id_user_eldar'];
$id_user_fiserv = $_POST['id_user_fiserv'];
$id_candidate = $_POST['id_candidate'];
$comment = $_POST['comment'];
$query = "INSERT INTO `comments`(`id`,`id_user_eldar`, `id_user_fiserv`, `id_candidate`, `comment`, `date`) VALUES (UUID(),'{$id_user_eldar}',NULL,'{$id_candidate}','{$comment}', current_timestamp())";
$result = mysqli_query($connection, $query);

if (!$result) {
    die('Query Failed.');
}

echo "comentario agregado correctamente";






?>