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
        $sql= "DELETE FROM studenti WHERE studente.id=:studente_id";
        $params= [
            ":studente_id"=> $_POST["id"] ?? null
        ];
    }else if($tipo==="docente"){
        $sql= "DELETE FROM docenti WHERE docente.id=:docente_id";
        $params= [
            ":docente_id"=> $_POST["id"] ?? null
        ];
    }else if($tipo==="corso"){
        $sql= "DELETE FROM corso WHERE corso.id=:corso_id";
        $params= [
            ":corso_id"=> $_POST["id"] ?? null
        ];
    }else if($tipo==="azienda"){
        $sql= "DELETE FROM aziende WHERE azienda.id=:azienda_id";
        $params= [
            ":azienda_id"=> $_POST["id"] ?? null
        ];
    }else if($tipo==="tirocinio"){
        $sql= "DELETE FROM tirocini WHERE tirocinio.id=:tirocinio_id";
        $params= [
            ":tirocinio_id"=> $_POST["id"] ?? null
        ];
    }else if($tipo==="slot"){
        $sql= "DELETE FROM slot WHERE slot.id=:slot_id";
        $params= [
            ":slot_id"=> $_POST["id"] ?? null
        ];
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