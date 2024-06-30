<?php

include '../../bd/Database.php';

$conexion = connect();

if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
    if (isset($_GET['id'])){
        //Mostrar una vocacion
        $sql = $conexion->prepare("SELECT * FROM vocacion where id=:id");
        $sql->bindValue(':id', $_GET['id']);
        $sql->execute();
        header("HTTP/1.1 200 OK");
        echo json_encode(  $sql->fetch(PDO::FETCH_ASSOC));
        exit();
	} else {        //Mostrar lista de vocacion
        $sql = $conexion->prepare("SELECT * FROM vocacion");
        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_ASSOC);
        header("HTTP/1.1 200 OK");
        echo json_encode( $sql->fetchAll());
        exit();
	}
}

?>