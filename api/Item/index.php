<?php

include '../../bd/Database.php'

$dbConn =  connect($db);

if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
    if (isset($_GET['id'])){
        //Mostrar un post
        $sql = $dbConn->prepare("SELECT * FROM item where id=:id");
        $sql->bindValue(':id', $_GET['id']);
        $sql->execute();
        header("HTTP/1.1 200 OK");
        echo json_encode(  $sql->fetch(PDO::FETCH_ASSOC)  );
        exit();
	}
    else {
        //Mostrar lista de post
        $sql = $dbConn->prepare("SELECT * FROM item");
        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_ASSOC);
        header("HTTP/1.1 200 OK");
        echo json_encode( $sql->fetchAll()  );
        exit();
	}
}


?>