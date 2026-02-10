<?php
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";
    header("Content-Type: application/json; charset=utf-8");
    session_start();

    if(!isset($_GET["log"])){
        http_response_code(400);
        echo json_encode(["ok"=>false,"message"=>"Parametro log mancante"]);
        exit;
    }

    $db=new mysqli($mysql_hostname, $mysql_username, $mysql_password, $mysql_db);
    if($db->connect_error){
        http_response_code(500);
        echo json_encode(["ok"=>false,"message"=>"Errore DB"]);
        exit;
    }

    if($_GET["log"] === "login"){
        $username= $_POST["username"] ?? '';
        $password= $_POST["password"] ?? '';
        if(!$username||!$password){
            echo json_encode(["ok"=>false,"message"=>"Username e password richiesti"]);
            exit;
        }
        $stmt= $db->prepare("SELECT id, username, livello, password FROM utenti WHERE username=?");
        $stmt->bind_param("s",$username);
        $stmt->execute();
        $result= $stmt->get_result();
        $user= $result->fetch_assoc();
        if($user && password_verify($password, $user["password"])){
            session_regenerate_id(true);
            $_SESSION["loggedIn"] = true;
            $_SESSION["username"] = $user["username"];
            $_SESSION["userId"] = $user["id"];
            $_SESSION["livello"] = $user["livello"];
            echo json_encode([
                "ok"=>true,
                "username"=>$user["username"],
                "livello"=>$user["livello"]
            ]);
        }else{
            echo json_encode(["ok"=>false,"message"=>"Username o password errati"]);
        }
    }else if($_GET["log"]==="logout"){
        session_unset();
        session_destroy();
        setcookie("PHPSESSID","",0,"/");
        echo json_encode(["ok"=>true]);
    }else if($_GET["log"]==="checkLogin"){
        if(!empty($_SESSION["loggedIn"]) && $_SESSION["loggedIn"]===true){
            echo json_encode([
                "ok"=>true,
                "username"=>$_SESSION["username"],
                "livello"=>$_SESSION["livello"]
            ]);
        }else{
            echo json_encode(["ok"=>false]);
        }
    }else{
        http_response_code(400);
        echo json_encode(["ok"=>false,"message"=>"Tipo di log non valido"]);
    }
    $db->close();
?>
