<?php
    include "_noncachare.php";
    include "_db.php";
    header("Content-Type: application/json; charset=utf-8");
    session_start();
    if($_GET["log"]==="login"){
        $db=new mysqli($mysql_hostname,$mysql_username,$mysql_password,$mysql_db);
        $q=$db->prepare("select id, username, livello from utenti where username=? and password=?");
        $hashPassword=sha1($_POST["password"]);
        $q->bind_param("ss",$_POST["username"],$hashPassword);
        $q->execute();
        $righe=$q->get_result();
        $r=$righe->fetch_array();
        if($r){
            $json=["ok"=>TRUE,"username"=>$r["username"],"livello"=>$r["livello"]];
            $_SESSION["loggedIn"]=TRUE;
            $_SESSION["username"]=$r["username"];
            $_SESSION["userId"]=$r["id"];
            $_SESSION["livello"]=$r["livello"];
            echo json_encode($json);
        }else{
            $json=["ok"=>FALSE,"message"=>"Username o password errati"];
            echo json_encode($json);
        }
        $db->close();
    }else if($_GET["log"]==="logout"){
        session_unset();
        setcookie("PHPSESSID","",0,"/");
        $json=["ok"=>TRUE];
        echo json_encode($json);
    }else if($_GET["log"]==="checkLogin"){
        if(isset($_SESSION["loggedIn"])&&$_SESSION["loggedIn"]){
            $json=["ok"=>TRUE,"username"=>$_SESSION["username"],"livello"=>$_SESSION["livello"]];
            echo json_encode($json);
        }else{
            $json=["ok"=>FALSE];
            echo json_encode($json);
        }
    }
?>
