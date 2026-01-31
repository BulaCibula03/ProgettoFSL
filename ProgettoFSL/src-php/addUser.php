<?php
    include "_noncachare.php";
    include "_db.php";
    header("Content-Type: application/json; charset=utf-8");
    session_start();

    if($_GET["op"]==="addUser"){
        $db=new mysqli($mysql_hostname,$mysql_username,$mysql_password,$mysql_db);
        $hash=sha1($_POST["password"]);
        if(empty($_POST["username"])||empty($_POST["password"])||$_POST["livello"]==="admin"||$_POST["livello"]==="read-only"||$_POST["livello"]==="user"||$_POST["livello"]==="reduced user"){
            echo json_encode([
                "ok" => false,
                "error" => "MISSING_DATA"
            ]);
            exit;
        }
        $q=$db->prepare("SELECT id FROM utenti WHERE username=?");
        $q->bind_param("s", $_POST["username"]);
        $q->execute();
        $q->store_result();
        if($q->num_rows>0){
            echo json_encode([
                "ok" => false,
                "error" => "USERNAME_EXISTS"
            ]);
            $db->close();
            exit;
        }
        $q=$db->prepare("INSERT INTO utenti (username, password, livello) VALUES (?,?,?)");
        $q->bind_param("ssi",$_POST["username"],$hash,$_POST["livello"]);
        if($q->execute()){
            echo json_encode([
                "ok" => true,
                "message" => "Utente aggiunto"
            ]);
        }else{
            echo json_encode([
                "ok"=>false,
                "error"=>"DB_ERROR"
            ]);
        }
        $db->close();
    }
?>