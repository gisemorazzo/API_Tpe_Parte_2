# API_Tpe_Parte_2

Este proyecto se puede ver en https://github.com/gisemorazzo/API_Tpe_Parte_2.git)

# Development server
Se necesita intalar Xampp (para poder levantar la base de datos (MySQL) y el servidor(Apache)).

Una vez instalado Xampp hay que ir a la carpeta donde lo haya instalado por ej:C:\xampp. Y dentro de htdocs haremos la copia del repositorio para poder levantar el servidor luego.

Luego hay que abrir el navegador y poner:

http://localhost/phpmyadmin

En el cual crearas una nueva base de datos llamada: db_tienda_natura, una vez creada tendras que importar la db_tienda_natura que se encuentra en el repositorio de esta manera obtendras los datos necesarios para poder ver el contenido de la pagina.

# Prueba con Postman
El endpoint de la API es: http://localhost/web2/Api/tpe2-api/api

# Verbo GET

ej:http://localhost/web2/Api/tpe2-api/api/productos (Trae todos los productos de la tabla).

ej: http://localhost/web2/Api/tpe2-api/api/productos?orden=ASC&atributo=precio (Ordena los productos en forma descendente o ascendente teniendo en cuenta el campo de la tablaque se pasa en el parametro "atributo").


# Verbo GET (busqueda por ID )
ej: http://localhost/web2/Api/tpe2-api/api/productos/24 (Devuelve un producto por su ID).



# Verbo POST
(Los parametros ID son autoincrementables no se tiene que pasar)

ej: http://localhost/web2/Api/tpe2-api/api/productos/ Para insertar un nuevo producto usar un JSON de este formato:
 {
    "nombre": "test product",
    "precio": 7457,
    "descripcion": "Lorem ipsum",
    "id_categoria_fk": 11
}


# VERBO DELETE
ej: http://localhost/web2/Api/tpe2-api/api/productos/24 (Elimina un producto por su ID).
