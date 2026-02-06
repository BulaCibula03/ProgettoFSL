<?php
    include "_noncachare.php";
    include "_db.php";
    header("Content-Type: application/json; charset=utf-8");
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
    if(!isset($_POST["data"])){
        http_response_code(400);
        echo "Dato mancante";
        exit;
    }
    $tipo= $_POST["type"];

    if($tipo==="studente"){
        $sql= "select * from studenti where studente.id=:studente_id";
        $params= [];
    }else if($tipo==="docente"){
        $sql= "select * from docenti where docente.id=:docente_id";
        $params= [];
    }else if($tipo==="corso"){
        $sql= "select * from corso where corso.id=:corso_id";
        $params= [];
    }else if($tipo==="azienda"){
        $sql= "select * from aziende where azienda.id=:azienda_id";
        $params= [];
    }else if($tipo==="tirocinio"){
        $sql= "select * from tirocini where tirocinio.id=:tirocinio_id";
        $params= [];
    }else{
        http_response_code(400);
        echo "Tipo non valido";
        exit;
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