<?php
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";
    header("Content-Type: application/json; charset=utf-8");

    if($_SERVER['REQUEST_METHOD'] === 'OPTIONS'){
        http_response_code(200);
        exit;
    }
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

    $raw=file_get_contents("php://input");
    $data=json_decode($raw, true);
    if(!$data){
        http_response_code(400);
        echo json_encode(["success"=>false, "error"=>"JSON non valido"]);
        exit;
    }
    $tipo=$data["type"] ?? null;
    if(!$tipo){
        http_response_code(400);
        echo json_encode(["success"=>false, "error"=>"Tipo mancante"]);
        exit;
    }

    if($tipo==="studente"){
        $sql= "select * from studenti";
    }else if($tipo==="docente"){
        $sql= "select * from docenti";
    }else if($tipo==="corso"){
        $sql= "select * from corso";
    }else if($tipo==="azienda"){
        $sql= "select * from aziende";
    }else if($tipo==="tirocinio"){
        $sql= "select * from tirocini";
    }else if($tipo==="slot"){
        $sql= "select * from slot";
    }else{
        http_response_code(400);
        echo json_encode(["success"=>false, "error"=>"Tipo non valido"]);
        exit;
    }
    $params= [];
    try {
        $stmt=$pdo->prepare($sql);
        $stmt->execute();
        $rows=$stmt->fetchAll();
        echo json_encode([
            "success"=>true,
            "data"=>$rows,
            "count"=>count($rows)
        ]);
    } catch (PDOException $e) {
        http_response_code(500);
        echo json_encode([
            "success"=>false,
            "error"=>$e->getMessage()
        ]);
    }
?>