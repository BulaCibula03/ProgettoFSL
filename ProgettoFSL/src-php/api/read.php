<?php
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";

    header("Content-Type: application/json; charset=utf-8");

    try {
        $pdo = new PDO(
            "mysql:host=$host;dbname=$db;charset=utf8mb4",
            $user,
            $pw,
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
        );
        $raw = file_get_contents("php://input");
        $data = json_decode($raw, true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new Exception("JSON non valido");
        }
        $tipo = $data["type"] ?? null;
        if (!$tipo) {
            throw new Exception("Tipo mancante");
        }
        switch($tipo){
            case "studente": $sql="SELECT * FROM studente"; break;
            case "docente": $sql="SELECT * FROM docente"; break;
            case "corso": $sql="SELECT * FROM corso"; break;
            case "azienda": $sql="SELECT * FROM azienda"; break;
            case "tirocinio": $sql="SELECT * FROM tirocinio"; break;
            case "slot": $sql="SELECT * FROM slot"; break;
            default:
                throw new Exception("Tipo non valido");
        }
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode([
            "success"=>true,
            "data"=>$rows,
            "count"=>count($rows)
        ]);
    } catch (Exception $e) {
        http_response_code(400);
        echo json_encode([
            "success"=>false,
            "error"=>$e->getMessage()
        ]);
    }