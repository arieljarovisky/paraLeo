<?php
include('config/config2.php');




if (isset($_POST['first_name'])) {
 
    $nombre = $_FILES["file"]["name"];
    $tipo = $_FILES["file"]["type"];
    $tamanio = $_FILES["file"]["size"];
    $ruta = $_FILES["file"]["tmp_name"];
    if ($nombre != "") {
      $destino = "files/" . $nombre;
  
      if (copy($ruta, $destino)) {
        $consulta = "UPDATE `candidates` SET `first_name`='{$_POST['first_name']}', `last_name`='{$_POST['last_name']}',`id_profile`='{$_POST['perfil_add']}',`birth_date`='{$_POST['birth_date']}',`description`='{$_POST['description']}',`email`='{$_POST['email']}',`id_status`='{$_POST['status_add']}',`phone`='{$_POST['phone']}', `file_name`='{$nombre}' WHERE `id`='{$_POST['id']}'";
        
      } else {
        echo "Error";
      }
    }else{  
      $consulta = "UPDATE `candidates` SET `first_name`='{$_POST['first_name']}', `last_name`='{$_POST['last_name']}',`id_profile`='{$_POST['perfil_add']}',`birth_date`='{$_POST['birth_date']}',`description`='{$_POST['description']}',`email`='{$_POST['email']}',`id_status`='{$_POST['status_add']}',`phone`='{$_POST['phone']}' WHERE `id`='{$_POST['id']}'";;
    }
   
    $result = mysqli_query($connection, $consulta);
    header("location: http://candidatos.eldars.com.ar:8080/front/cchh/candidatos");

}