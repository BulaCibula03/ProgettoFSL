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
        $sql= "INSERT INTO studenti (cognome, nome, matricola, cittadinanza, sesso, data_nascita, cellulareAllievo, cellulareEmergenza1, cellulareEmergenza2, email1, email2, idResidenza, idNascita, idGenitore1, idGenitore2, Classe1, nRegistro1, Classe2, nRegistro2) VALUES (:cognome, :nome, :matricola, :cittadinanza, :sesso, :data_nascita, :cellulareAllievo, :cellulareEmergenza1, :cellulareEmergenza2, :email1, :email2, :idResidenza, :idNascita, :idGenitore1, :idGenitore2, :Classe1, :nRegistro1, :Classe2, :nRegistro2)";
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
            ":Classe1"=> $_POST["idClasse1"] ?? null,
            ":nRegistro1"=> $_POST["nRegistro1"] ?? null,
            ":Classe2"=> $_POST["idClasse2"] ?? null,
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
        $sql= "INSERT INTO aziende (nome,natura,comune_sl,indirizzo_sl,comune,indirizzo,cod_fiscale,part_iva,tel,mail,sito,leg_rapp_nome,leg_rapp_nato_a,leg_rapp_dt,leg_rapp_cf,leg_tel,leg_note,note,ateco,'check',nproto,dproto,firma,attiva,prncct,idDocente,sportiva,inglese) VALUES (:id,:nome,:natura,:comune_sl,:indirizzo_sl,:comune,:indirizzo,:cod_fiscale,:part_iva,:tel,:mail,:sito,:leg_rapp_nome,:leg_rapp_nato_a,:leg_rapp_dt,:leg_rapp_cf,:leg_tel,:leg_note,:note,:ateco,':check',:nproto,:dproto,:firma,:attiva,:prncct,:idDocente,:sportiva,:inglese)";
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
    }else if($tipo==="slot"){
        $sql= "INSERT INTO slot (idS,idAzienda,annoScolastico,datai,dataf,oreprev,idtirocinio,tipo,impiego,schi,sinf,smec,slst,note,attivita,idCreatore) VALUES (:idS,:idAzienda,:annoScolastico,:datai,:dataf,:oreprev,:idtirocinio,:tipo,:impiego,:schi,:sinf,:smec,:slst,:note,:attivita,:idCreatore)";
        $params= [
            ":idS"=> $_POST["idS"] ?? null,
            ":idAzienda"=> $_POST["idAzienda"] ?? null,
            ":annoScolastico"=> $_POST["annoScolastico"] ?? null,
            ":datai"=> $_POST["datai"] ?? null,
            ":dataf"=> $_POST["dataf"] ?? null,
            ":oreprev"=> $_POST["oreprev"] ?? null,
            ":idtirocinio"=> $_POST["idtirocinio"] ?? null,
            ":tipo"=> $_POST["tipo"] ?? null,
            ":impiego"=> $_POST["impiego"] ?? null,
            ":schi"=> $_POST["schi"] ?? null,
            ":sinf"=> $_POST["sinf"] ?? null,
            ":smec"=> $_POST["smec"] ?? null,
            ":slst"=> $_POST["slst"] ?? null,
            ":note"=> $_POST["note"] ?? null,
            ":attivita"=> $_POST["attivita"] ?? null,
            ":idCreatore"=> $_POST["idCreatore"] ?? null
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