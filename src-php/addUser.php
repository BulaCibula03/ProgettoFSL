<?php
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";
    header("Content-Type: application/json; charset=utf-8");
    session_start();

    if($_GET["op"]==="addUser"){
        $db=new mysqli($mysql_hostname, $mysql_username, $mysql_password, $mysql_db);
        if($db->connect_error){
            echo json_encode(["ok"=>false,"error"=>"DB_CONNECTION_FAILED"]);
            exit;
        }
        $username=trim($_POST["username"] ?? '');
        $password=$_POST["password"] ?? '';
        $livello=$_POST["livello"] ?? '';
        $allowed_levels = ["user", "reduced user"];
        if (empty($username) || empty($password) || !in_array($livello, $allowed_levels)) {
            echo json_encode([
                "ok" => false,
                "error" => "MISSING_OR_INVALID_DATA"
            ]);
            exit;
        }
        $q=$db->prepare("SELECT id FROM utenti WHERE username=?");
        $q->bind_param("s", $username);
        $q->execute();
        $q->store_result();
        if($q->num_rows > 0){
            echo json_encode(["ok" => false, "error" => "USERNAME_EXISTS"]);
            $db->close();
            exit;
        }
        $hash = password_hash($password, PASSWORD_DEFAULT);
        $q=$db->prepare("INSERT INTO utenti (username, password, livello) VALUES (?, ?, ?)");
        $q->bind_param("sss", $username, $hash, $livello);

        if($q->execute()){
            echo json_encode(["ok"=>true, "message"=>"Utente aggiunto"]);
        }else{
            echo json_encode(["ok"=>false, "error"=>"DB_ERROR"]);
        }

        $db->close();
    }
?>
