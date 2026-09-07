CREATE DATABASE emprendimiento_indumentaria;

USE emprendimiento_indumentaria;


CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);


CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);


CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    talle VARCHAR(10) NOT NULL,
    color VARCHAR(25) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,

    FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);


CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);


CREATE TABLE detalle_ventas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,

    FOREIGN KEY (id_venta)
        REFERENCES ventas(id_venta),

    FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);