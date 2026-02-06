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
        $sql= "UPDATE studenti SET cognome=:cognome, nome=:nome, matricola=:matricola, cittadinanza=:cittadinanza, sesso=:sesso, data_nascita=:data_nascita, cellulareAllievo=:cellulareAllievo, cellulareEmergenza1=:cellulareEmergenza1, cellulareEmergenza2=:cellulareEmergenza2, email1=:email1, email2=:email2, idResidenza=:idResidenza, idNascita=:idNascita, idGenitore1=:idGenitore1, idGenitore2=:idGenitore2, idClasse1=:idClasse1, nRegistro1=:nRegistro1, idClasse2=:idClasse2, nRegistro2=:nRegistro2 WHERE studente.id=:studente_id";
        $params= [
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
        $sql= "UPDATE docenti SET nominativo=:nominativo, data_nascita=:data_nascita, luogo=:luogo, cf=:cf, indirizzo=:indirizzo, email=:email, cell=:cell, esterno=:esterno, ente=:ente, tipo=:tipo WHERE docente.id=:docente_id";
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
        $sql= "UPDATE corso SET idTipo=:idTipo, idModo=:idModo, annoScolastico=:annoScolastico, descrizione=:descrizione, data_inizio=:data_inizio, data_fine=:data_fine, ore=:ore, docente=:docente, esterno=:esterno, note=:note, enteEsterno=:enteEsterno WHERE corso.id=:corso_id";
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
        $sql= "UPDATE aziende SET id=:id, nome=:nome, natura=:natura, comune_sl=:comune_sl, indirizzo_sl=:indirizzo_sl, comune=:comune, indirizzo=:indirizzo, cod_fiscale=:cod_fiscale, part_iva=:part_iva, tel=:tel, mail=:mail, sito=:sito, leg_rapp_nome=:leg_rapp_nome, leg_rapp_nato_a=:leg_rapp_nato_a, leg_rapp_dt=:leg_rapp_dt, leg_rapp_cf=:leg_rapp_cf, leg_tel=:leg_tel, leg_note=:leg_note, note=:note, ateco=:ateco,'check'=':check', nproto=:nproto,dproto=:dproto,firma=:firma,attiva=:attiva,prncct=:prncct,idDocente=idDocente,sportiva=sportiva,inglese=inglese WHERE azienda.id=:azienda_id";
        $params= [
            ":id"=> $_POST["id"] ?? null,
            ":nome"=> $_POST["nome"] ?? null,
            ":natura"=> $_POST["natura"] ?? null,
            ":comune_sl"=> $_POST["comune_sl"] ?? null,
            ":indirizzo_sl"=> $_POST["indirizzo_sl"] ?? null,
            ":comune"=> $_POST["comune"] ?? null,
            ":indirizzo"=> $_POST["indirizzo"] ?? null,
            ":cod_fiscale"=> $_POST["cod_fiscale"] ?? null,
            ":part_iva"=> $_POST["part_iva"] ?? null,
            ":tel"=> $_POST["tel"] ?? null,
            ":mail"=> $_POST["mail"] ?? null,
            ":sito"=> $_POST["sito"] ?? null,
            ":leg_rapp_nome"=> $_POST["leg_rapp_nome"] ?? null,
            ":leg_rapp_nato_a"=> $_POST["leg_rapp_nato_a"] ?? null,
            ":leg_rapp_dt"=> $_POST["leg_rapp_dt"] ?? null,
            ":leg_rapp_cf"=> $_POST["leg_rapp_cf"] ?? null,
            ":leg_tel"=> $_POST["leg_tel"] ?? null,
            ":leg_note"=> $_POST["leg_note"] ?? null,
            ":note"=> $_POST["note"] ?? null,
            ":ateco"=> $_POST["ateco"] ?? null
        ];
    }else if($tipo==="tirocinio"){
        $sql= "UPDATE tirocini SET studente_id=:studente_id, oreEffettuate=:oreEffettuate, classe=:classe, annoScolastico=:annoScolastico, tutor=:tutor, dataPfi=:dataPfi, data_inizioEff=:data_inizioEff, data_fineEff=:data_fineEff, giudizio=:giudizio, valutazione=:valutazione, invioMail=:invioMail, restpfi=:restpfi, restsva=:restsva, restsvs=:restsvs, restffp=:restffp, note=:note WHERE tirocinio.id=:tirocinio_id";
        $params= [
            ":studente_id"=> $_POST["studente_id"] ?? null,
            ":oreEffettuate"=> $_POST["oreEffettuate"] ?? null,
            ":classe"=> $_POST["classe"] ?? null,
            ":annoScolastico"=> $_POST["annoScolastico"] ?? null,
            ":tutor"=> $_POST["tutor"] ?? null,
            ":dataPfi"=> $_POST["dataPfi"] ?? null,
            ":data_inizioEff"=> $_POST["data_inizioEff"] ?? null,
            ":data_fineEff"=> $_POST["data_fineEff"] ?? null,
            ":giudizio"=> $_POST["giudizio"] ?? null,
            ":valutazione"=> $_POST["valutazione"] ?? null,
            ":invioMail"=> $_POST["invioMail"] ?? null,
            ":restpfi"=> $_POST["restpfi"] ?? null,
            ":restsva"=> $_POST["restsva"] ?? null,
            ":restsvs"=> $_POST["restsvs"] ?? null,
            ":restffp"=> $_POST["restffp"] ?? null,
            ":note"=> $_POST["note"] ?? null
        ];
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