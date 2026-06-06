<?php
    session_start();
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";
    header("Content-Type: application/json; charset=utf-8");

    if(!isset($_GET["log"])){
        http_response_code(400);
        echo json_encode(["ok"=>false,"message"=>"Parametro log mancante"]);
        exit;
    }

    $DB=new mysqli($host, $user, $pw, $db);
    if($DB->connect_error){
        http_response_code(500);
        echo json_encode(["ok"=>false,"message"=>"Errore DB: ".$DB->connect_errno." - ".$DB->connect_error]);
        exit;
    }
    $log = $_GET["log"];
    if($log === "login"){
        $username= $_POST["username"] ?? '';
        $password= $_POST["password"] ?? '';
        if(!$username||!$password){
            http_response_code(400);
            echo json_encode(["ok"=>false,"message"=>"Username e password richiesti"]);
            exit;
        }
        $stmt= $DB->prepare("SELECT id, username, livello, password FROM utente WHERE username=?");
        $stmt->bind_param("s",$username);
        $stmt->execute();
        $result= $stmt->get_result();
        $utente= $result->fetch_assoc();
        $stmt->close();
        if($utente && password_verify($password, $utente["password"])){
            session_regenerate_id(true);
            $_SESSION["loggedIn"] = true;
            $_SESSION["username"] = $utente["username"];
            $_SESSION["userId"] = $utente["id"];
            $_SESSION["livello"] = $utente["livello"];
            echo json_encode([
                "ok"=>true,
                "username"=>$utente["username"],
                "livello"=>$utente["livello"]
            ]);
        }else{
            http_response_code(401);
            echo json_encode(["ok"=>false,"message"=>"Username o password errati"]);
            exit;
        }
    }else if($log==="logout"){
        session_unset();
        session_destroy();
        setcookie("PHPSESSID","",0,"/");
        echo json_encode(["ok"=>true]);
    }else if($log==="checkLogin"){
        if(!empty($_SESSION["loggedIn"]) && $_SESSION["loggedIn"]===true){
            echo json_encode([
                "ok"=>true,
                "username"=>$_SESSION["username"],
                "livello"=>$_SESSION["livello"]
            ]);
        }else{
            http_response_code(200);
            echo json_encode(["ok"=>false]);
            exit;
        }
    }else{
        http_response_code(400);
        echo json_encode(["ok"=>false,"message"=>"Tipo di log non valido"]);
    }
    $DB->close();
?>
