<?php
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";
    header("Content-Type: application/json; charset=utf-8");

    if($_SERVER['REQUEST_METHOD']==='OPTIONS'){
        http_response_code(200);
        exit;
    }
    try{
        $pdo=new PDO(
            "mysql:host=$host;dbname=$db;charset=utf8",
            $user,
            $pw,
            [PDO::ATTR_ERRMODE=> PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=> PDO::FETCH_ASSOC]
        );
    }catch (PDOException $e){
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
    $id=$data["id"] ?? null;
    if(!$tipo||!$id){
        http_response_code(400);
        echo json_encode(["success"=>false, "error"=>"Type o ID mancante"]);
        exit;
    }

    if($tipo==="studente"){
        $sql="UPDATE studenti SET cognome=:cognome, nome=:nome, matricola=:matricola, cittadinanza=:cittadinanza, sesso=:sesso, data_nascita=:data_nascita, cellulareAllievo=:cellulareAllievo, cellulareEmergenza1=:cellulareEmergenza1, cellulareEmergenza2=:cellulareEmergenza2, email1=:email1, email2=:email2, idResidenza=:idResidenza, idNascita=:idNascita, idGenitore1=:idGenitore1, idGenitore2=:idGenitore2, Classe1=:Classe1, nRegistro1=:nRegistro1, Classe2=:Classe2, nRegistro2=:nRegistro2 WHERE id=:id";
        $params= [
            ":id"=> $data["id"] ?? null,
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
        $sql= "UPDATE docenti SET nominativo=:nominativo, data_nascita=:data_nascita, luogo=:luogo, cf=:cf, indirizzo=:indirizzo, email=:email, cell=:cell, esterno=:esterno, ente=:ente, tipo=:tipo WHERE id=:id";
        $params=[
            ":id"=> $data["id"] ?? null,
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
        $sql= "UPDATE corso SET idTipo=:idTipo, idModo=:idModo, annoScolastico=:annoScolastico, descrizione=:descrizione, data_inizio=:data_inizio, data_fine=:data_fine, ore=:ore, docente=:docente, esterno=:esterno, note=:note, enteEsterno=:enteEsterno WHERE id=:id";
        $params= [
            ":id"=> $data["id"] ?? null,
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
        $sql= "UPDATE aziende SET id=:id, nome=:nome, natura=:natura, comune_sl=:comune_sl, indirizzo_sl=:indirizzo_sl, comune=:comune, indirizzo=:indirizzo, cod_fiscale=:cod_fiscale, part_iva=:part_iva, tel=:tel, mail=:mail, sito=:sito, leg_rapp_nome=:leg_rapp_nome, leg_rapp_nato_a=:leg_rapp_nato_a, leg_rapp_dt=:leg_rapp_dt, leg_rapp_cf=:leg_rapp_cf, leg_tel=:leg_tel, leg_note=:leg_note, note=:note, ateco=:ateco,`check`=:check, nproto=:nproto,dproto=:dproto,firma=:firma,attiva=:attiva,prncct=:prncct,idDocente=idDocente,sportiva=sportiva,inglese=inglese WHERE id=:id";
        $params= [
            ":id"=> $data["id"] ?? null,
            ":nome"=> $data["nome"] ?? null,
            ":natura"=> $data["natura"] ?? null,
            ":comune_sl"=> $data["comune_sl"] ?? null,
            ":indirizzo_sl"=> $data["indirizzo_sl"] ?? null,
            ":comune"=> $data["comune"] ?? null,
            ":indirizzo"=> $data["indirizzo"] ?? null,
            ":cod_fiscale"=> $data["cod_fiscale"] ?? null,
            ":part_iva"=> $data["part_iva"] ?? null,
            ":tel"=> $data["tel"] ?? null,
            ":mail"=> $data["mail"] ?? null,
            ":sito"=> $data["sito"] ?? null,
            ":check"=>$data['check']??null,
            ":leg_rapp_nome"=> $data["leg_rapp_nome"] ?? null,
            ":leg_rapp_nato_a"=> $data["leg_rapp_nato_a"] ?? null,
            ":leg_rapp_dt"=> $data["leg_rapp_dt"] ?? null,
            ":leg_rapp_cf"=> $data["leg_rapp_cf"] ?? null,
            ":leg_tel"=> $data["leg_tel"] ?? null,
            ":leg_note"=> $data["leg_note"] ?? null,
            ":note"=> $data["note"] ?? null,
            ":ateco"=> $data["ateco"] ?? null
        ];
    }else if($tipo==="tirocinio"){
        $sql= "UPDATE tirocini SET studente_id=:studente_id, oreEffettuate=:oreEffettuate, classe=:classe, annoScolastico=:annoScolastico, tutor=:tutor, dataPfi=:dataPfi, data_inizioEff=:data_inizioEff, data_fineEff=:data_fineEff, giudizio=:giudizio, valutazione=:valutazione, invioMail=:invioMail, restpfi=:restpfi, restsva=:restsva, restsvs=:restsvs, restffp=:restffp, note=:note WHERE id=:id";
        $params= [
            ":id"=> $data["id"] ?? null,
            ":studente_id"=> $data["studente_id"] ?? null,
            ":oreEffettuate"=> $data["oreEffettuate"] ?? null,
            ":classe"=> $data["classe"] ?? null,
            ":annoScolastico"=> $data["annoScolastico"] ?? null,
            ":tutor"=> $data["tutor"] ?? null,
            ":dataPfi"=> $data["dataPfi"] ?? null,
            ":data_inizioEff"=> $data["data_inizioEff"] ?? null,
            ":data_fineEff"=> $data["data_fineEff"] ?? null,
            ":giudizio"=> $data["giudizio"] ?? null,
            ":valutazione"=> $data["valutazione"] ?? null,
            ":invioMail"=> $data["invioMail"] ?? null,
            ":restpfi"=> $data["restpfi"] ?? null,
            ":restsva"=> $data["restsva"] ?? null,
            ":restsvs"=> $data["restsvs"] ?? null,
            ":restffp"=> $data["restffp"] ?? null,
            ":note"=> $data["note"] ?? null
        ];
    }else if($tipo==="slot"){
        $sql= "UPDATE slot SET data=:data, ora=:ora, id_azienda=:id_azienda WHERE id=:id";
        $params= [
            ":id"=> $data["id"] ?? null,
            ":data"=> $data["data"] ?? null,
            ":ora"=> $data["ora"] ?? null,
            ":id_azienda"=> $data["id_azienda"] ?? null
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
            "rowsAffected" => $stmt->rowCount()
        ]);
    }catch(PDOException $e){
        http_response_code(500);
        echo json_encode([
            "success"=> false,
            "error"=> $e->getMessage()
        ]);
    }
?>