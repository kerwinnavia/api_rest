<?php
    require_once 'class/respuestas.class.php';
    require_once 'class/centro.class.php';

    $_respuestas = new respuestas;
    $_centro = new centro;


    if($_SERVER['REQUEST_METHOD'] == "GET"){

        if(isset($_GET["page"])){
            $pagina = $_GET["page"];
            $listacentro = $_centro->listacentro($pagina);
            header("Content-Type: application/json");
            echo json_encode($listacentro);
            http_response_code(200);
        }else if(isset($_GET['id'])){
            $id = $_GET['id'];
            $datoscentro = $_centro->obtenercentro($id);
            header("Content-Type: application/json");
            echo json_encode($datoscentro);
            http_response_code(200);
        }
        
    }else if($_SERVER['REQUEST_METHOD'] == "POST"){
        //recibimos los datos enviados
        $postBody = file_get_contents("php://input");
        //enviamos los datos al manejador
        $datosArray = $_centro->post($postBody);
        //delvovemos una respuesta 
        header('Content-Type: application/json');
        if(isset($datosArray["result"]["error_id"])){
            $responseCode = $datosArray["result"]["error_id"];
            http_response_code($responseCode);
        }else{
            http_response_code(200);
        }
        echo json_encode($datosArray);
        
    }else if($_SERVER['REQUEST_METHOD'] == "PUT"){
        //recibimos los datos enviados
        $postBody = file_get_contents("php://input");
        //enviamos datos al manejador
        $datosArray = $_centro->put($postBody);
            //delvovemos una respuesta 
        header('Content-Type: application/json');
        if(isset($datosArray["result"]["error_id"])){
            $responseCode = $datosArray["result"]["error_id"];
            http_response_code($responseCode);
        }else{
            http_response_code(200);
        }
        echo json_encode($datosArray);

    }else if($_SERVER['REQUEST_METHOD'] == "DELETE"){

        $headers = getallheaders();
        if(isset($headers['token']) && isset($headers['Id'])){
            $send = [
                "token" => $headers['token'],
                "Id" => $headers['Id']
            ];
            $postBody = json_encode($send);
        }else{
            $postBody = file_get_contents("php://input");
        }

        //enviamos datos al manejador
        $datosArray = $_centro->delete($postBody);
        //delvovemos una respuesta 
        header('Content-Type: application/json');
        if(isset($datosArray["result"]["error_id"])){
                echo json_encode($datosArray);  $responseCode = $datosArray["result"]["error_id"];
                http_response_code($responseCode);
        }else{
                http_response_code(200);
        }

    }else{
        header('Content-Type: application/json');
        $datosArray = $_respuestas->error_405();
        echo json_encode($datosArray);
    }


?>