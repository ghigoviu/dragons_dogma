<?php

function connect(){
    try {
        $conn = new PDO("mysql:host=localhost;dbname=dragons_dogma", 'root', '');

        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $exception) {
        exit($exception->getMessage());
    }
  }

?>