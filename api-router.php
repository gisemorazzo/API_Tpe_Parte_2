<?php
require_once './libs/Router.php';
require_once 'app/controllers/api.controller.php';


$router = new Router();

$router->addRoute('productos','GET','ApiController','getProducts'); //ok
$router->addRoute('productosEnOfertaPorCategoria/:ID','GET','ApiController','getProductsOnSaleByCategory'); //ok
$router->addRoute('productos/:ID','GET','ApiController','getProducto'); //ok
$router->addRoute('productos/:ID','DELETE','ApiController','deleteProducto'); //ok
$router->addRoute('productos','POST','ApiController','insertProducto'); //ok
$router->addRoute('productos','PUT','ApiController','editarProducto'); 


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);