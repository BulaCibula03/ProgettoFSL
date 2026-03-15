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
            [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]
        );
    }catch(PDOException $e){
        http_response_code(500);
        echo json_encode(["success"=>false, "error"=>"Errore DB"]);
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
        $sql= "INSERT INTO studenti (cognome, nome, matricola, cittadinanza, sesso, data_nascita, cellulareAllievo, cellulareEmergenza1, cellulareEmergenza2, email1, email2, idResidenza, idNascita, idGenitore1, idGenitore2, Classe1, nRegistro1, Classe2, nRegistro2) VALUES (:cognome, :nome, :matricola, :cittadinanza, :sesso, :data_nascita, :cellulareAllievo, :cellulareEmergenza1, :cellulareEmergenza2, :email1, :email2, :idResidenza, :idNascita, :idGenitore1, :idGenitore2, :Classe1, :nRegistro1, :Classe2, :nRegistro2)";
        $params=[
            ":cognome"=> $data["cognome"] ?? null,
            ":nome"=> $data["nome"] ?? null,
            ":matricola"=> $data["matricola"] ?? null,
            ":cittadinanza"=> $data["cittadinanza"] ?? null,
            ":sesso"=> $data["sesso"] ?? null,
            ":data_nascita"=> $data["data_nascita"] ?? null,
            ":cellulareAllievo"=> $data["cellulareAllievo"] ?? null,
            ":cellulareEmergenza1"=> $data["cellulareEmergenza1"] ?? null,
            ":cellulareEmergenza2"=> $data["cellulareEmergenza2"] ?? null,
            ":email1"=> $data["email1"] ?? null,
            ":email2"=> $data["email2"] ?? null,
            ":idResidenza"=> $data["idResidenza"] ?? null,
            ":idNascita"=> $data["idNascita"] ?? null,
            ":idGenitore1"=> $data["idGenitore1"] ?? null,
            ":idGenitore2"=> $data["idGenitore2"] ?? null,
            ":Classe1"=> $data["idClasse1"] ?? null,
            ":nRegistro1"=> $data["nRegistro1"] ?? null,
            ":Classe2"=> $data["idClasse2"] ?? null,
            ":nRegistro2"=> $data["nRegistro2"] ?? null
        ];
    }else if($tipo==="docente"){
        $sql= "INSERT INTO docenti (nominativo, data_nascita, luogo, cf, indirizzo, email, cell, esterno, ente, tipo) VALUES (:nominativo, :data_nascita, :luogo, :cf, :indirizzo, :email, :cell, :esterno, :ente, :tipo)";
        $params= [
            ":nominativo"=> $data["nominativo"] ?? null,
            ":data_nascita"=> $data["data_nascita"] ?? null,
            ":luogo"=> $data["luogo"] ?? null,
            ":cf"=> $data["cf"] ?? null,
            ":indirizzo"=> $data["indirizzo"] ?? null,
            ":email"=> $data["email"] ?? null,
            ":cell"=> $data["cell"] ?? null,
            ":esterno"=> $data["esterno"] ?? null,
            ":ente"=> $data["ente"] ?? null,
            ":tipo"=> $data["tipo"] ?? null
        ];
    }else if($tipo==="corso"){
        $sql= "INSERT INTO corso (idTipo, idModo, annoScolastico, descrizione, data_inizio, data_fine, ore, docente, esterno, note, enteEsterno) VALUES (:idTipo, :idModo, :annoScolastico, :descrizione, :data_inizio, :data_fine, :ore, :docente, :esterno, :note, :enteEsterno)";
        $params= [
            ":idTipo"=> $data["idTipo"] ?? null,
            ":idModo"=> $data["idModo"] ?? null,
            ":annoScolastico"=> $data["annoScolastico"] ?? null,
            ":descrizione"=> $data["descrizione"] ?? null,
            ":data_inizio"=> $data["data_inizio"] ?? null,
            ":data_fine"=> $data["data_fine"] ?? null,
            ":ore"=> $data["ore"] ?? null,
            ":docente"=> $data["docente"] ?? null,
            ":esterno"=> $data["esterno"] ?? null,
            ":note"=> $data["note"] ?? null,
            ":enteEsterno"=> $data["enteEsterno"] ?? null
        ];
    }else if($tipo==="azienda"){
        $sql= "INSERT INTO aziende (nome, natura, comune_sl, indirizzo_sl, comune, indirizzo,cod_fiscale, part_iva, tel, mail, sito,leg_rapp_nome, leg_rapp_nato_a, leg_rapp_dt, leg_rapp_cf,leg_tel, leg_note, note, ateco, `check`,nproto, dproto, firma, attiva, prncct,idDocente, sportiva, inglese) VALUES (:nome, :natura, :comune_sl, :indirizzo_sl, :comune, :indirizzo,:cod_fiscale, :part_iva, :tel, :mail, :sito,:leg_rapp_nome, :leg_rapp_nato_a, :leg_rapp_dt, :leg_rapp_cf,:leg_tel, :leg_note, :note, :ateco, :check,:nproto, :dproto, :firma, :attiva, :prncct,:idDocente, :sportiva, :inglese)";
        $params = [
            ":nome" => $data["nome"] ?? null,
            ":natura" => $data["natura"] ?? null,
            ":comune_sl" => $data["comune_sl"] ?? null,
            ":indirizzo_sl" => $data["indirizzo_sl"] ?? null,
            ":comune" => $data["comune"] ?? null,
            ":indirizzo" => $data["indirizzo"] ?? null,
            ":cod_fiscale" => $data["cod_fiscale"] ?? null,
            ":part_iva" => $data["part_iva"] ?? null,
            ":tel" => $data["tel"] ?? null,
            ":mail" => $data["mail"] ?? null,
            ":sito" => $data["sito"] ?? null,
            ":leg_rapp_nome" => $data["leg_rapp_nome"] ?? null,
            ":leg_rapp_nato_a" => $data["leg_rapp_nato_a"] ?? null,
            ":leg_rapp_dt" => $data["leg_rapp_dt"] ?? null,
            ":leg_rapp_cf" => $data["leg_rapp_cf"] ?? null,
            ":leg_tel" => $data["leg_tel"] ?? null,
            ":leg_note" => $data["leg_note"] ?? null,
            ":note" => $data["note"] ?? null,
            ":ateco" => $data["ateco"] ?? null,
            ":check" => $data["check"] ?? 0,
            ":nproto" => $data["nproto"] ?? null,
            ":dproto" => $data["dproto"] ?? null,
            ":firma" => $data["firma"] ?? 0,
            ":attiva" => $data["attiva"] ?? 1,
            ":prncct" => $data["prncct"] ?? 0,
            ":idDocente" => $data["idDocente"] ?? null,
            ":sportiva" => $data["sportiva"] ?? 0,
            ":inglese" => $data["inglese"] ?? 0
        ];
    }
else if($tipo==="slot"){
        $sql= "INSERT INTO slot (idS,idAzienda,annoScolastico,datai,dataf,oreprev,idtirocinio,tipo,impiego,schi,sinf,smec,slst,note,attivita,idCreatore) VALUES (:idS,:idAzienda,:annoScolastico,:datai,:dataf,:oreprev,:idtirocinio,:tipo,:impiego,:schi,:sinf,:smec,:slst,:note,:attivita,:idCreatore)";
        $params= [
            ":idAzienda"=> $data["idAzienda"] ?? null,
            ":annoScolastico"=> $data["annoScolastico"] ?? null,
            ":datai"=> $data["datai"] ?? null,
            ":dataf"=> $data["dataf"] ?? null,
            ":oreprev"=> $data["oreprev"] ?? null,
            ":idtirocinio"=> $data["idtirocinio"] ?? null,
            ":tipo"=> $data["tipo"] ?? null,
            ":impiego"=> $data["impiego"] ?? null,
            ":schi"=> $data["schi"] ?? null,
            ":sinf"=> $data["sinf"] ?? null,
            ":smec"=> $data["smec"] ?? null,
            ":slst"=> $data["slst"] ?? null,
            ":note"=> $data["note"] ?? null,
            ":attivita"=> $data["attivita"] ?? null,
            ":idCreatore"=> $data["idCreatore"] ?? null
        ];
    }else{
        http_response_code(400);
        echo json_encode([
            "success"=> false,
            "error"=> "Tipo non valido"
        ]);
        exit;
    }
    
    try{
        $stmt=$pdo->prepare($sql);
        $stmt->execute($params);

        echo json_encode([
            "success"=> true,
            "id"=> $pdo->lastInsertId()
        ]);
    }catch (PDOException $e){
        http_response_code(500);
        echo json_encode([
            "success"=> false,
            "error"=> $e->getMessage()
        ]);
    }
?>