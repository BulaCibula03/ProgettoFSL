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
        $sql= "INSERT INTO studenti (cognome, nome, matricola, cittadinanza, sesso, data_nascita, cellulareAllievo, cellulareEmergenza1, cellulareEmergenza2, email1, email2, idResidenza, idNascita, idGenitore1, idGenitore2, idClasse1, nRegistro1, idClasse2, nRegistro2) VALUES (:cognome, :nome, :matricola, :cittadinanza, :sesso, :data_nascita, :cellulareAllievo, :cellulareEmergenza1, :cellulareEmergenza2, :email1, :email2, :idResidenza, :idNascita, :idGenitore1, :idGenitore2, :idClasse1, :nRegistro1, :idClasse2, :nRegistro2)";
        $params=[
            ":cognome"=> $_POST["cognome"] ?? null,
            ":nome"=> $_POST["nome"] ?? null,
            ":matricola"=> $_POST["matricola"] ?? null,
            ":cittadinanza"=> $_POST["cittadinanza"] ?? null,
            ":sesso"=> $_POST["sesso"] ?? null,
            ":data_nascita"=> $_POST["data_nascita"] ?? null,
            ":cellulareAllievo"=> $_POST["cellulareAllievo"] ?? null,
            ":cellulareEmergenza1"=> $_POST["cellulareEmergenza1"] ?? null,
            ":cellulareEmergenza2"=> $_POST["cellulareEmergenza2"] ?? null,
            ":email1"=> $_POST["email1"] ?? null,
            ":email2"=> $_POST["email2"] ?? null,
            ":idResidenza"=> $_POST["idResidenza"] ?? null,
            ":idNascita"=> $_POST["idNascita"] ?? null,
            ":idGenitore1"=> $_POST["idGenitore1"] ?? null,
            ":idGenitore2"=> $_POST["idGenitore2"] ?? null,
            ":idClasse1"=> $_POST["idClasse1"] ?? null,
            ":nRegistro1"=> $_POST["nRegistro1"] ?? null,
            ":idClasse2"=> $_POST["idClasse2"] ?? null,
            ":nRegistro2"=> $_POST["nRegistro2"] ?? null
        ];
    }else if($tipo==="docente"){
        $sql= "INSERT INTO docenti (nominativo, data_nascita, luogo, cf, indirizzo, email, cell, esterno, ente, tipo) VALUES (:nominativo, :data_nascita, :luogo, :cf, :indirizzo, :email, :cell, :esterno, :ente, :tipo)";
        $params= [
            ":nominativo"=> $_POST["nominativo"] ?? null,
            ":data_nascita"=> $_POST["data_nascita"] ?? null,
            ":luogo"=> $_POST["luogo"] ?? null,
            ":cf"=> $_POST["cf"] ?? null,
            ":indirizzo"=> $_POST["indirizzo"] ?? null,
            ":email"=> $_POST["email"] ?? null,
            ":cell"=> $_POST["cell"] ?? null,
            ":esterno"=> $_POST["esterno"] ?? null,
            ":ente"=> $_POST["ente"] ?? null,
            ":tipo"=> $_POST["tipo"] ?? null
        ];
    }else if($tipo==="corso"){
        $sql= "INSERT INTO corso (idTipo, idModo, annoScolastico, descrizione, data_inizio, data_fine, ore, docente, esterno, note, enteEsterno) VALUES (:idTipo, :idModo, :annoScolastico, :descrizione, :data_inizio, :data_fine, :ore, :docente, :esterno, :note, :enteEsterno)";
        $params= [
            ":idTipo"=> $_POST["idTipo"] ?? null,
            ":idModo"=> $_POST["idModo"] ?? null,
            ":annoScolastico"=> $_POST["annoScolastico"] ?? null,
            ":descrizione"=> $_POST["descrizione"] ?? null,
            ":data_inizio"=> $_POST["data_inizio"] ?? null,
            ":data_fine"=> $_POST["data_fine"] ?? null,
            ":ore"=> $_POST["ore"] ?? null,
            ":docente"=> $_POST["docente"] ?? null,
            ":esterno"=> $_POST["esterno"] ?? null,
            ":note"=> $_POST["note"] ?? null,
            ":enteEsterno"=> $_POST["enteEsterno"] ?? null
        ];
    }else if($tipo==="azienda"){
        $sql= "INSERT INTO aziende (nome, indirizzo) VALUES (:nome, :indirizzo)";
        $params= [];
    }else if($tipo==="tirocinio"){
        $sql= "INSERT INTO tirocini (studente_id, azienda_id, corso_id, data_inizio, data_fine) VALUES (:studente_id, :azienda_id, :corso_id, :data_inizio, :data_fine)";
        $params= [];
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