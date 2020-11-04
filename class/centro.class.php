<?php
require_once "conexion/conexion.php";
require_once "respuestas.class.php";


class centro extends conexion {

    private $table = "centroproduccion";
    private $id = "ID";
    private $id_suc = "id_sucursal";
    private $detalle = "detalle";
    private $activo = "activo";

//912bc00f049ac8464472020c5cd06759

    public function listacentro($pagina = 1){
        $inicio  = 0 ;
        $cantidad = 30;
        if($pagina > 1){
            $inicio = ($cantidad * ($pagina - 1)) +1 ;
            $cantidad = $cantidad * $pagina;
        }
        $query = "SELECT Id, Id_sucursal, Detalle, Activo FROM " . $this->table . " limit $inicio,$cantidad";
        $datos = parent::obtenerDatos($query);
        return ($datos);
    }

    public function obtenercentro($id){
        $query = "SELECT * FROM " . $this->table . " WHERE ID = '$id'";
        return parent::obtenerDatos($query);

    }

    public function post($json){
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);

                if(!isset($datos['id_sucursal']) || !isset($datos['detalle']) || !isset($datos['activo'])){
                    return $_respuestas->error_400();
                }else{
                    $this->id_suc = $datos['id_sucursal'];
                    $this->detalle = $datos['detalle'];
                    $this->activo = $datos['activo'];
                    $resp = $this->insertarcentro();
                    if($resp){
                        $respuesta = $_respuestas->response;
                        $respuesta["result"] = array(
                            "id" => $resp
                        );
                        return $respuesta;
                    }else{
                        return $_respuestas->error_500();
                    }
                }
    }

    private function insertarcentro(){
        $query = "INSERT INTO " . $this->table . " (Id_sucursal,Detalle,Activo)
        values
        ('" . $this->id_suc . "','" . $this->detalle . "','" . $this->activo ."')";
        print_r($query);
        $resp = parent::nonQueryId($query);
        if($resp){
             return $resp;
        }else{
            return 0;
        }
    }
    
    public function put($json){
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);
         
                if(!isset($datos['id'])){
                    return $_respuestas->error_400();
                }else{
                    $this->id = $datos['id'];
                    if(isset($datos['id_sucursal'])) { $this->id_suc = $datos['id_sucursal']; }
                    if(isset($datos['detalle'])) { $this->detalle = $datos['detalle']; }
                    if(isset($datos['activo'])) { $this->activo = $datos['activo']; }
                   
                    $resp = $this->modificarcentro();
                    if($resp){
                        $respuesta = $_respuestas->response;
                        $respuesta["result"] = array(
                            "Id" => $this->id
                        );
                        return $respuesta;
                    }else{
                        return $_respuestas->error_500();
                    }
                }


    }


    private function modificarcentro(){
        $query = "UPDATE " . $this->table . " SET Id_sucursal ='" . $this->id_suc . "',Detalle = '" . $this->detalle . "', Activo = '" . $this->activo . 
         "' WHERE Id = '" . $this->id . "'"; 
        $resp = parent::nonQuery($query);
        if($resp >= 1){
             return $resp;
        }else{
            return 0;
        }
    }


    public function delete($json){
        $_respuestas = new respuestas;
        $datos = json_decode($json,true);

        if(!isset($datos['id'])){
                    return $_respuestas->error_400();
                }else{
                    $this->id = $datos['Id'];
                    $resp = $this->eliminarcentro();
                    if($resp){
                        $respuesta = $_respuestas->response;
                        $respuesta["result"] = array(
                            "Id" => $this->id,
                            "msg" => "Registro Eliminado"
                        );
                        return $respuesta;
                    }else{
                        return $_respuestas->error_500();
                    }
                }    
    }

    private function eliminarcentro(){
        $query = "DELETE FROM " . $this->table . " WHERE Id= '" . $this->id . "'";
        $resp = parent::nonQuery($query);
        if($resp >= 1 ){
            return $resp;
        }else{
            return 0;
        }
    }


}

?>