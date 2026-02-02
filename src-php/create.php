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
        $sql= "INSERT INTO studenti (nome, email) VALUES (:nome, :email)";
        $params= [];
    }else if($tipo==="docente"){
        $sql= "INSERT INTO docenti (nome, email) VALUES (:nome, :email)";
        $params= [];
    }else if($tipo==="corso"){
        $sql= "INSERT INTO corsi (nome, descrizione) VALUES (:nome, :descrizione)";
        $params= [];
    }else if($tipo==="azienda"){
        $sql= "INSERT INTO aziende (nome, indirizzo) VALUES (:nome, :indirizzo)";
        $params= [];
    }else if($tipo==="tirocinio"){
        $sql= "INSERT INTO tirocini (studente_id, azienda_id, corso_id, data_inizio, data_fine) VALUES (:studente_id, :azienda_id, :corso_id, :data_inizio, :data_fine)";
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