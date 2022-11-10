-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 00:49:09
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_tienda_natura`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(10, 'perfumes masculinos'),
(11, 'perfumes femeninos'),
(13, 'cremas corporales'),
(15, 'maquillaje'),
(16, 'cremas faciales'),
(17, 'cuidados diarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(250) NOT NULL,
  `nombre` text NOT NULL,
  `precio` float NOT NULL,
  `descripcion` text NOT NULL,
  `id_categoria_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`, `descripcion`, `id_categoria_fk`) VALUES
(24, 'ilia', 8475, 'Una fragancia enriquecida con un ingrediente natural inédito extraído de la Paramela\r\nCamino olfativo:\r\n\r\nfloral intenso jazmin vainilla pomelo. \r\n\r\n \r\n\r\nInstrucciones de uso:\r\n\r\nPara resaltar más el perfume, aplique en las muñecas, en el cuello, en el escote y por detrás de las oreja.\r\n\r\n \r\n\r\nA quién está dirigido:\r\n\r\nPara la mujer independiente, activa y libre.\r\n\r\n \r\n\r\nContenido:\r\n\r\n50 ml.', 11),
(25, 'Ilía Secreto', 8545, 'Una fragancia enriquecida con Ishpink, ingrediente natural inédito de la Amazonia que provoca los sentidos y guarda los secretos de la fuerza femenina. Misterio, fuerza y ​​sofisticación. La cremosidad de las flores blancas, como el muguet, contrasta con notas dulces de haba tonka, un acorde de frutas rojas y un toque exclusivo de café arábigo.', 11),
(26, 'Natura Ekos Frescor Pitanga Eau de Toilette', 3346, 'Una fragancia radiante y refrescante. El brillo de un día de verano, que combina la frescura de las notas cítricas y hojas verdes con la ligereza del muguet, toque picante de jengibre envueltos por los acordes frutales de buriti, un ingrediente natural de la biodiversidad brasileña. Enriquecido con óleo esencial 100% natural de pitanga', 11),
(27, 'Essencial Oud Eau de Parfum Masculino', 7861, 'Essencial es poder ser. Para protagonistas de su propia vida que son capaces de transformar e inspirar. La grandeza de Oud, la madera más noble del mundo, con la sensualidad de copaíba, una madera de la biodiversidad brasileña, realzada con un toque exótico de especias. Provocar al mismo tiempo que conquistar.', 10),
(28, 'Crema Nutritiva para el Cuerpo Tododia Frambuesa y Pimienta Rosa', 1980, 'Despiertá tus sentidos con el Crema Nutritiva para el Cuerpo Tododia Frambuesa y Pimienta Rosa. Fórmula inteligente con nutrición prebiótica que se adapta a las necesidades diarias de tu piel. Tododia es día de sentirte bien con las cremas corporales de Natura Tododia. Tododia es día para ti.', 13),
(29, 'Pulpa hidratante corporal Tukuma', 2145, 'Potente antiseñales corporal que estimula y protege la producción natural de ácido hialurónico. Con doble acción de manteca y óleo bruto de tukumá, rellena hasta las capas más profundas de la piel, actuando sobre los signos del envejecimiento. Piel renovada y uniforme.     Bioactivo Tukumá.  Estimula y protege la producción natural de ácido hialurónico de la piel.  Piel renovada y uniforme Textura cremosa Producto vegano Amazonia viva', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `nombre`, `password`) VALUES
(1, 'giigii.morazzo@gmail.com', 'ivana gisele', '$2y$10$0dsT9xqh9/9MYfzAAcy29uyojuqKnG34rgWuY5TmxxjW7M9oJKZJe'),
(2, 'ivana@gmail.com', 'gisele', '$2y$10$Dwul9QlsCcmPBZyWLo0Cy.m1RXyB8xiX5YIBK7R1KAwiFiWeU/tie'),
(3, 'ivana.morazzo@hotmail.com', 'ivana gisele', '$2y$10$KaAUNK3gQfbFRO/zTF45z.OMC2gzeBHgaxi6mlI.rBACpN5XlZI7C');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`),
  ADD KEY `id_categoria_fk_2` (`id_categoria_fk`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
