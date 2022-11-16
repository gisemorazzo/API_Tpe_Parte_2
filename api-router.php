<?php
require_once './libs/Router.php';
require_once 'app/controllers/api.controller.php';


$router = new Router();

$router->addRoute('productos','GET','ApiController','getProducts'); 
$router->addRoute('productosEnOfertaPorCategoria/:ID','GET','ApiController','getProductsOnSaleByCategory');
$router->addRoute('productos/:ID','GET','ApiController','getProducto'); 
$router->addRoute('productos/:ID','DELETE','ApiController','deleteProducto'); 
$router->addRoute('productos','POST','ApiController','insertProducto'); 
$router->addRoute('productos','PUT','ApiController','editarProducto'); 


$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);