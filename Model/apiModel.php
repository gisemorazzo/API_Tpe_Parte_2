<?php

class ProductoModel{

    private $db;
    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tienda_natura;charset=utf8', 'root', '');
    }

    function getProducts(){
        $query = $this->db->prepare("SELECT * FROM producto");
        $query->execute();
    
        $products = $query->fetchAll(PDO::FETCH_OBJ); 
        
        return $products;
    }
    function insertProducts($nombre, $precio, $descripcion, $id_categoria_fk) {
        $query = $this->db->prepare("INSERT INTO producto (nombre, precio, descripcion, id_categoria_fk) VALUES (?, ?, ?, ?)");
        $query->execute([$nombre, $precio, $descripcion, $id_categoria_fk]);
        
        return $this->db->lastInsertId();
    }
    function deleteProduct($id){
        $query = $this->db->prepare("DELETE FROM producto WHERE producto.id = ?");
        $query->execute(array($id));
    }
    function updateProduct($id, $nombre, $precio, $descripcion, $id_categoria_fk){
        $query = $this->db->prepare("UPDATE producto SET nombre=?, precio=?, descripcion=?, id_categoria_fk=? WHERE producto.id=?");
        $query->execute([$nombre, $precio, $descripcion, $id_categoria_fk, $id]);

        return $this->db->lastInsertId();

    }
    function getProduct($id){
        $query = $this->db->prepare( "SELECT producto.id, producto.nombre, producto.descripcion, producto.precio,
         producto.id_categoria_fk,categoria.nombre AS nombre_categoria FROM producto JOIN categoria ON producto.id_categoria_fk = categoria.id WHERE producto.id=?;");
        $query->execute(array($id));
        $product = $query->fetch(PDO::FETCH_OBJ);
        return $product;
    }
}

    /**
     * Elimina una tarea dado su id.
     */
    function delete($id) {
        $query = $this->db->prepare('DELETE FROM categoria WHERE id = ?');
        $query->execute([$id]);
    }

    public function finalize($id) {
        $query = $this->db->prepare('UPDATE categoria SET finalizada = 1 WHERE id = ?');
        $query->execute([$id]);
        // var_dump($query->errorInfo()); // y eliminar la redireccion
    }
}