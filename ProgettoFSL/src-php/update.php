<?php
    $host= "localhost";
    $db= "er_pcto";
    $user= "utente";
    $pw= "";
    try{
        $pdo=new PDO(
            "mysql:host=$host;dbname=$db;charset=utf8",
            $user,
            $pw,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
    }catch(PDOException $e){
        http_response_code(500);
        echo json_encode(["error"=>"Errore DB"]);
        exit;
    }

    $dato= $_POST["data"] ?? null;
    if(!isset($_POST["type"])){
        http_response_code(400);
        echo "Tipo mancante";
        exit;
    }
    $tipo= $_POST["type"];

    if($tipo==="studente"){
        $sql= "UPDATE studenti SET nome=:nome, email=:email WHERE studente_id=:studente_id";
        $params= [];
    }else if($tipo==="docente"){
        $sql= "UPDATE docenti SET nome=:nome, email=:email WHERE docente_id=:docente_id";
        $params= [];
    }else if($tipo==="corso"){
        $sql= "UPDATE corsi SET nome=:nome, descrizione=:descrizione WHERE corso_id=:corso_id";
        $params= [];
    }else if($tipo==="azienda"){
        $sql= "UPDATE aziende SET nome=:nome, indirizzo=:indirizzo WHERE azienda_id=:azienda_id";
        $params= [];
    }else if($tipo==="tirocinio"){
        $sql= "UPDATE tirocini SET studente_id=:studente_id, azienda_id=:azienda_id, corso_id=:corso_id, data_inizio=:data_inizio, data_fine=:data_fine WHERE tirocinio_id=:tirocinio_id";
        $params= [];
    }
    
    try{
        $stmt= $pdo->prepare($sql);
        $stmt->execute($params);
        echo json_encode([
            "success"=> true,
            "id"=> $pdo->lastInsertId()
        ]);
    }catch(PDOException $e){
        http_response_code(500);
        echo json_encode([
            "success"=> false,
            "error"=> $e->getMessage()
        ]);
    }
?>