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
    if(!isset($_POST["type"])){
        http_response_code(400);
        echo "Tipo mancante";
        exit;
    }
    $tipo= $_POST["type"];

    if($tipo==="studente"){
        $sql= "UPDATE studenti SET nome=:nome, email=:email WHERE studente.id=:studente_id";
        $params= [];
    }else if($tipo==="docente"){
        $sql= "UPDATE docenti SET nome=:nome, email=:email WHERE docente.id=:docente_id";
        $params= [];
    }else if($tipo==="corso"){
        $sql= "UPDATE corsi SET nome=:nome, descrizione=:descrizione WHERE corso.id=:corso_id";
        $params= [];
    }else if($tipo==="azienda"){
        $sql= "UPDATE aziende SET nome=:nome, indirizzo=:indirizzo WHERE azienda.id=:azienda_id";
        $params= [];
    }else if($tipo==="tirocinio"){
        $sql= "UPDATE tirocini SET studente.id=:studente_id, azienda.id=:azienda_id, corso.id=:corso_id, data.inizio=:data_inizio, data.fine=:data_fine WHERE tirocinio.id=:tirocinio_id";
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