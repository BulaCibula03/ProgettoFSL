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

    $username= $_POST["user"] ?? null;
    $password= $_POST["password"] ?? null;
    if ($username===null || $password===null) {
        http_response_code(400);
        echo json_encode(["error"=>"Credenziali mancanti"]);
        exit;
    }
    $sql= "SELECT id, password FROM utenti WHERE username=:username";
    $stmt= $pdo->prepare($sql);
    
    $admin= $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$admin) {
        http_response_code(401);
        echo json_encode(["accesso"=>"vietato"]);
        exit;
    }
    if (!password_verify($password,$admin["password"])) {
        http_response_code(401);
        echo json_encode(["accesso"=>"vietato"]);
        exit;
    }

    echo json_encode([
        "accesso" => "consentito",
        "user_id" => $admin["id"]
    ]);
?>