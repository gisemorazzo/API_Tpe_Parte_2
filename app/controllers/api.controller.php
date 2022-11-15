<?php
require_once 'app/models/api.model.php';
require_once 'app/views/api.view.php';

class ApiController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new TaskModel();
        $this->view = new ApiView();
        
        // lee el body del request
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }

    public function getProducts() {
        $orden = null;
        $atributo = null;
        $limit = 5;
        $page = 0;

        if(isset($_GET["orden"])) {
            $orden = $_GET["orden"];
        }
        if(isset($_GET["atributo"])) {
            $atributo = $_GET["atributo"];
        }
        if(isset($_GET["limit"])) {
            $limit = $_GET["limit"];
        }
        if(isset($_GET["page"])) {
            $page = $_GET["page"];
        }
        $productos = $this->model->getAllProducts($orden, $atributo, $page, $limit);
        if($productos != null) {
            $this->view->response($productos, 200);
        } else {
            $this->view->response("Error, 'orden' o 'atriburo' invalido", 400);
        }
    }
    function getProductsOnSaleByCategory($params = null){
        $id = $params[':ID'];
        $productos = $this->model->getProductsOnSaleByCategory($id);
        if($productos != null) {
            $this->view->response($productos, 200);
        } else {
            $this->view->response("Error, 'atriburo' invalido", 400);
        }
    }
    

    public function getProducto($params = null) {
        // obtengo el id del arreglo de params
        $id = $params[':ID'];
        $producto = $this->model->getProducto($id);

        // si no existe devuelvo 404
        if ($producto)
            $this->view->response($producto);
        else 
            $this->view->response("La tarea con el id=$id no existe", 404);
    }

    public function deleteProducto($params = null) {
        $id = $params[':ID'];

        $producto = $this->model->getProducto($id);
        if ($producto) {
            $this->model->deleteProducto($id);
            $this->view->response($producto);
        } else 
            $this->view->response("La tarea con el id=$id no existe", 404);
    }

    public function insertProducto() {
        $producto = $this->getData();

        if (empty($producto->nombre) || empty($producto->precio) || empty($producto->descripcion) || empty($producto->id_categoria_fk) || !isset($_GET["token"])) {
            $this->view->response("Complete los datos", 400);
        } else {
            $id = $this->model->insertProducto($producto->nombre, $producto->precio, $producto->descripcion, $producto->id_categoria_fk);
            $producto = $this->model->getProducto($id);
            $this->view->response($producto, 201);
        }
    }

    }

