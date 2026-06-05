<?php
    session_start();
    include "_noncachare.php";
    include "_db.php";
    include "_access.php";

    header("Content-Type: application/json; charset=utf-8");

    // SECURITY: Verifica autenticazione PRIMA di qualsiasi operazione
    /*if (empty($_SESSION['loggedIn']) || !isset($_SESSION['username'])) {
        http_response_code(401);
        echo json_encode([
            "success" => false,
            "error" => "Non autenticato"
        ]);
        exit;
    }*/

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
        
        $limit = isset($data["limit"]) ? intval($data["limit"]) : 100;
        $limit = min($limit, 200); // Previene abusi di memoria
        $offset = isset($data["offset"]) ? intval($data["offset"]) : 0;
        
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
        
        $countStmt = $pdo->prepare("SELECT COUNT(*) FROM ($sql) as total");
        $countStmt->execute();
        $totalCount = $countStmt->fetchColumn();
        
        $sql .= " LIMIT :limit OFFSET :offset";
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        echo json_encode([
            "success"=>true,
            "data"=>$rows,
            "count"=>count($rows),
            "total"=>$totalCount,
            "limit"=>$limit,
            "offset"=>$offset
        ]);
    } catch (Exception $e) {
        http_response_code(400);
        echo json_encode([
            "success"=>false,
            "error"=>$e->getMessage()
        ]);
    }