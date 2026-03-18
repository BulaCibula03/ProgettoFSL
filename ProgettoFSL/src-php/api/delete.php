<?php
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";
    header("Content-Type: application/json; charset=utf-8");

    if($_SERVER['REQUEST_METHOD']==='OPTIONS'){
        http_response_code(200);
        exit;
    }
    try{
        $pdo=new PDO(
            "mysql:host=$host;dbname=$db;charset=utf8",
            $user,
            $pw,
            [PDO::ATTR_ERRMODE=> PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=> PDO::FETCH_ASSOC]
        );
    }catch (PDOException $e){
        http_response_code(500);
        echo json_encode(["success" => false, "error" => "Errore DB"]);
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
    $id=$data["id"] ?? null;
    if(!$tipo||!$id){
        http_response_code(400);
        echo json_encode(["success"=>false, "error"=>"Type o ID mancante"]);
        exit;
    }

    switch ($tipo) {
        case "studente":
            $sql="DELETE FROM studenti WHERE id=:id";
            break;
        case "docente":
            $sql="DELETE FROM docenti WHERE id=:id";
            break;
        case "corso":
            $sql="DELETE FROM corso WHERE id=:id";
            break;
        case "azienda":
            $sql="DELETE FROM aziende WHERE id=:id";
            break;
        case "tirocinio":
            $sql="DELETE FROM tirocini WHERE id=:id";
            break;
        case "slot":
            $sql="DELETE FROM slot WHERE id=:id";
            break;
        default:
            http_response_code(400);
            echo json_encode(["success" => false, "error" => "Tipo non valido"]);
            exit;
    }
    $params=[":id" => $id];
    
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