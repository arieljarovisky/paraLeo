<?php
include('config/config2.php');



    $nombre = $_FILES["file"]["name"];
    $tipo = $_FILES["file"]["type"];
    $tamanio = $_FILES["file"]["size"];
    $ruta = $_FILES["file"]["tmp_name"];
    $destino = "files/" . $nombre;
    if ($nombre != "") {
        if (copy($ruta, $destino)) {
            $first_name = $_POST['first_name'];
            $last_name = $_POST['last_name'];
            $birth_date =$_POST['birth_date'];
            $profile= $_POST['perfil_add'];
            $description = $_POST['description'];
            $status = $_POST['status'];
            $province = $_POST['provincias'];
            $phone = $_POST['phone'];
            $email = $_POST['email'];
            $id_seniority=$_POST['seniority'];
            $query = "INSERT INTO `candidates`(`id`,`first_name`, `last_name`, `birth_date`, `description`, `id_profile`, `id_seniority`,`id_status`, `id_province`, `phone`, `email`, `file_name`) VALUES (UUID(),'{$first_name}','{$last_name}','{$birth_date}','{$description}','{$profile}','{$id_seniority}','{$status}','$province','{$phone}','{$email}','{$nombre}')";
            $result = mysqli_query($connection, $query);

            if (!$result) {
                die('Query Failed.');
            }

            echo "candidato agregado correctamente";
        }
    }

?>