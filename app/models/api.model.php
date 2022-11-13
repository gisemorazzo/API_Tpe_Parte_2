<?php

class TaskModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tienda_natura;charset=utf8', 'root', '');
    }
    public function getAllProducts($orden, $atributo, $page, $limit) {
        $query = null;
        if(!empty($orden)&&!empty($atributo)&&!empty($page)&&!empty($limit)){
            $offset = ($page > 1) ? ($limit * ($page - 1)) : 0;
            $query = $this->db->prepare("SELECT * FROM producto ORDER BY $atributo $orden LIMIT $offset, $limit");
        }
        else if (!empty($orden)&&!empty($atributo)){
            $query = $this->db->prepare("SELECT * FROM producto ORDER BY $atributo $orden");
        }else{
            $query = $this->db->prepare("SELECT * FROM producto");
        }
        $query->execute();
        $productos = $query->fetchAll(PDO::FETCH_OBJ);
        
        return $productos;
    }
        
    public function getProducto($id) {
        $query = $this->db->prepare("SELECT * FROM producto WHERE id = ?");
        $query->execute([$id]);
        $producto = $query->fetch(PDO::FETCH_OBJ);
        
        return $producto;
    }
    public function insertProducto($nombre, $precio, $descripcion, $id_categoria_fk) {
        $query = $this->db->prepare("INSERT INTO producto (nombre, precio, descripcion, id_categoria_fk) VALUES (?, ?, ?, ?)");
        $query->execute([$nombre, $precio, $descripcion, $id_categoria_fk]);

        return $this->db->lastInsertId();
    }
    function deleteProducto($id) {
        $query = $this->db->prepare('DELETE FROM producto WHERE producto.id = ?');
        $query->execute([$id]);
    }

    public function editarProducto($id, $nombre, $precio, $descripcion, $id_categoria_fk){
        $query = $this->db->prepare("UPDATE producto SET nombre=?, precio=?, descripcion=?, id_categoria_fk=? WHERE producto.id=?");
        $query->execute([$nombre, $precio, $descripcion, $id_categoria_fk, $id]);

        return $this->db->lastInsertId();
    }
}
