-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:        11.8.6-MariaDB-0+deb13u1 from Debian - -- Please help get to 10k stars at https://github.com/MariaDB/Server
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:            12.21.1.1
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para indumentaria
CREATE DATABASE IF NOT EXISTS `indumentaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `indumentaria`;

-- Volcando estructura para tabla indumentaria.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla indumentaria.categoria: ~0 rows (aproximadamente)
INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
	(1, 'Remeras'),
	(2, 'Pantalones'),
	(3, 'Buzos'),
	(4, 'Camperas'),
	(5, 'Zapatillas');

-- Volcando estructura para tabla indumentaria.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla indumentaria.cliente: ~0 rows (aproximadamente)
INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `telefono`, `email`) VALUES
	(1, 'Juan', 'Pérez', '1123456789', 'juanperez@gmail.com'),
	(2, 'Martina', 'Gómez', '1167894321', 'martinagomez@gmail.com');

-- Volcando estructura para tabla indumentaria.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `fk_detalle_venta` (`id_venta`),
  KEY `fk_detalle_producto` (`id_producto`),
  CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla indumentaria.detalle_venta: ~10 rows (aproximadamente)
INSERT INTO `detalle_venta` (`id_detalle`, `cantidad`, `precio_unitario`, `id_venta`, `id_producto`) VALUES
	(1, 2, 15000.00, 1, 1),
	(2, 1, 18500.00, 1, 2),
	(3, 1, 35000.00, 2, 4),
	(4, 2, 38000.00, 2, 6),
	(5, 1, 55000.00, 3, 8),
	(6, 1, 21000.00, 3, 3),
	(7, 1, 42000.00, 1, 5),
	(8, 2, 40000.00, 2, 7),
	(9, 1, 68000.00, 3, 9),
	(10, 1, 75000.00, 3, 10);

-- Volcando estructura para tabla indumentaria.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `talle` varchar(10) DEFAULT NULL,
  `color` varchar(25) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_productos_categoria` (`id_categoria`),
  CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla indumentaria.producto: ~10 rows (aproximadamente)
INSERT INTO `producto` (`id_producto`, `nombre`, `talle`, `color`, `precio`, `stock`, `id_categoria`) VALUES
	(1, 'Remera básica negra', 'M', 'Negro', 15000.00, 20, 1),
	(2, 'Remera oversize blanca', 'L', 'Blanco', 18500.00, 15, 1),
	(3, 'Remera estampada urbana', 'XL', 'Gris', 21000.00, 10, 1),
	(4, 'Jean clásico azul', '42', 'Azul', 35000.00, 8, 2),
	(5, 'Pantalón cargo beige', '40', 'Beige', 42000.00, 12, 2),
	(6, 'Buzo canguro negro', 'L', 'Negro', 38000.00, 7, 3),
	(7, 'Buzo oversize gris', 'XL', 'Gris', 40000.00, 6, 3),
	(8, 'Campera de jean', 'L', 'Azul', 55000.00, 5, 4),
	(9, 'Campera puffer negra', 'M', 'Negro', 68000.00, 4, 4),
	(10, 'Zapatillas urbanas blancas', '42', 'Blanco', 75000.00, 6, 5);

-- Volcando estructura para tabla indumentaria.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_ventas_cliente` (`id_cliente`),
  CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Volcando datos para la tabla indumentaria.venta: ~0 rows (aproximadamente)
INSERT INTO `venta` (`id_venta`, `fecha`, `id_cliente`) VALUES
	(1, '2026-10-01', 1),
	(2, '2026-10-02', 2),
	(3, '2026-10-03', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
