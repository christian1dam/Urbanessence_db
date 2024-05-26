CREATE DATABASE Urbanessence;
GO

USE Urbanessence;
GO

-- TABLAS CREADAS POR KEVIN --
-- CREACIÓN DE LA TABLA CLIENTE --
CREATE TABLE cliente(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(80) NOT NULL,
	genero BIT NOT NULL,
	direccion NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(9) NOT NULL,
	fechaNac DATE,

	CONSTRAINT pk_cliente PRIMARY KEY(id)
);

-- TABLAS CREADAS POR MIGUEL --
-- CREACIÓN DE LA TABLA TIPO --
CREATE TABLE tipo(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(20) NOT NULL,

	CONSTRAINT pk_tipo PRIMARY KEY(id)
);

-- TABLAS CREADAS POR DANIEL --
-- CREACIÓN DE LA TABLA CIUDAD --
CREATE TABLE ciudad(
	id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	provincia VARCHAR(50) NOT NULL,
	numHabitantes INT NOT NULL,

	CONSTRAINT PK_Ciudad PRIMARY KEY(id)
);

-- TABLAS CREADAS POR DANIEL --
-- CREACIÓN DE LA TABLA TIENDA --
CREATE TABLE tienda(
	id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	direccion NVARCHAR(100) NOT NULL,
	telefono INT NOT NULL,
	horarioApertura TIME NOT NULL,
	horarioCierre TIME NOT NULL,
	numEmpleados INT NOT NULL,
	idCiudad INT NOT NULL,

	CONSTRAINT PK_Tienda PRIMARY KEY(id),
	CONSTRAINT FK_Ciudad FOREIGN KEY(idCiudad) REFERENCES ciudad(id)
);

-- TABLAS CREADAS POR DANIEL --
-- CREACIÓN DE LA TABLA EMPLEADO --
CREATE TABLE empleado(
	id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellidos VARCHAR(50) NOT NULL,
	fechaNac DATE NOT NULL, 
	direccion NVARCHAR(100) NOT NULL,
	fechaCont DATE NOT NULL,
	cargo VARCHAR(20) NOT NULL,
	salario DECIMAL(8,2) NOT NULL,
	NUSS varchar(12) NOT NULL,
	idTienda INT NOT NULL,

	CONSTRAINT PK_Empleado PRIMARY KEY(id),
	CONSTRAINT FK_Tienda FOREIGN KEY(idTienda) REFERENCES tienda(id)
);

-- TABLAS CREADAS POR MIGUEL --
-- CREACIÓN DE LA TABLA PRODUCTO --
create table producto(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(50) NOT NULL,
	marca NVARCHAR(30) NOT NULL,
	talla NVARCHAR(5) NOT NULL,
	color NVARCHAR(20) NOT NULL,
	material NVARCHAR(100) NOT NULL,
	precio DECIMAL(6,2) NOT NULL,
	idTipo INT NOT NULL,
	cantidad INT NOT NULL,

	CONSTRAINT pk_producto PRIMARY KEY (id),
	CONSTRAINT fk_tipo_producto FOREIGN KEY (idTipo) REFERENCES tipo(id)
);

-- TABLAS CREADAS POR CHRISTIAN --
-- CREACIÓN DE LA TABLA PROVEEDOR --
create table proveedor(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(100) NOT NULL,
	direccion NVARCHAR(150) NOT NULL,
	telefono NVARCHAR(9) NOT NULL,
	NIF NVARCHAR(9) NOT NULL,
	correoElectronico NVARCHAR(70) NOT NULL,
	ciudadID INT NOT NULL,

	CONSTRAINT PK_proveedor PRIMARY KEY(id),
	CONSTRAINT FK_ciudad_proveedor FOREIGN KEY(ciudadID) REFERENCES ciudad(id)
);

-- TABLAS CREADAS POR KEVIN --
-- CREACIÓN DE LA TABLA PEDIDO --
create table pedido(
	id INT IDENTITY(1,1) NOT NULL,
	fecha DATE NOT NULL,
	totalPedido DECIMAL(8,2) NOT NULL,
	telefono NVARCHAR(9) NOT NULL,
	horario TIME NOT NULL,
	idCliente INT NOT NULL,
	idEmpleado INT NOT NULL,

	CONSTRAINT pk_pedido PRIMARY KEY (id),
	CONSTRAINT fk_cliente_pedido FOREIGN KEY (idCliente) REFERENCES cliente(id),
	CONSTRAINT fk_empleado_pedido FOREIGN KEY (idEmpleado) REFERENCES empleado(id)
);

-- TABLAS CREADAS POR KEVIN --
-- CREACIÓN DE LA TABLA pedidoProducto --
create table pedidoProducto(
	id INT identity(1,1) NOT NULL,
	cantidad INT NOT NULL,
	idPedido INT NOT NULL,
	idProducto INT NOT NULL,

	CONSTRAINT pk_pedidoProducto PRIMARY KEY(id),
	CONSTRAINT fk_pedido_pedidoProducto FOREIGN KEY(idPedido) REFERENCES pedido(id),
	CONSTRAINT fk_producto_pedidoProducto FOREIGN KEY(idProducto) REFERENCES producto(id)
);

-- TABLAS CREADAS POR CHRISTIAN --
-- CREACIÓN DE LA TABLA productoPerteneceTienda --
CREATE TABLE productoTienda(
	productoID INT NOT NULL,
	tiendaID INT NOT NULL,
	cantidad INT NOT NULL,

	CONSTRAINT PK_productoTienda PRIMARY KEY(productoID, tiendaID),
	CONSTRAINT FK_ProductoPT FOREIGN KEY(productoID) REFERENCES producto(id),
	CONSTRAINT FK_TiendaPT FOREIGN KEY(tiendaID) REFERENCES tienda(id)
)


INSERT INTO tipo (nombre) VALUES 
('Camisetas'),
('Pantalones'),
('Chaquetas'),
('Zapatillas'),
('Jerseys'),
('Sudaderas'),
('Tops'),
('Ropa interior'),
('Shorts'),
('Abrigos'),
('Chalecos'),
('Ropa de deporte');

--INSERTS TABLA CIUDAD--
INSERT INTO ciudad (nombre, provincia, numHabitantes) VALUES
('Madrid', 'Madrid', 3200000),
('Barcelona', 'Barcelona', 1600000),
('Valencia', 'Valencia', 800000),
('Sevilla', 'Sevilla', 690000),
('Zaragoza', 'Zaragoza', 680000),
('Málaga', 'Málaga', 570000),
('Murcia', 'Murcia', 450000),
('Palma', 'Islas Baleares', 410000),
('Las Palmas de Gran Canaria', 'Las Palmas', 380000),
('Bilbao', 'Vizcaya', 350000),
('Alicante', 'Alicante', 340000),
('Córdoba', 'Córdoba', 330000),
('Valladolid', 'Valladolid', 310000),
('Vigo', 'Pontevedra', 300000),
('Gijón', 'Asturias', 280000),
('La Coruña', 'La Coruña', 246000),
('Granada', 'Granada', 240000),
('Oviedo', 'Asturias', 220000),
('Cartagena', 'Murcia', 210000);

INSERT INTO producto (nombre, marca, talla, color, material, precio, idTipo, cantidad) VALUES 
('Camiseta algodón', 'Nike', 'M', 'Negro', 'Algodón', 29.99, 1, 150),
('Camiseta estampada ', 'Adidas', 'L', 'Azul', 'Algodón', 24.99, 1, 300),
('Camisa de algodón a cuadros', 'Tommy Hilfiger', 'L', 'Azul y Blanco', 'Algodón', 49.99, 1, 40),
('Pantalón vaquero slim fit', 'Wrangler', '32', 'Negro', 'Denim', 69.99, 2, 50),
('Pantalón deportivo transpirable', 'Under Armour', 'XL', 'Negro', 'Poliéster', 49.99, 2, 80),
('Chaqueta de cuero genuino', 'Zara', 'M', 'Negro', 'Cuero', 149.99, 3, 40),
('Chaqueta acolchada impermeable', 'The North Face', 'L', 'Gris', 'Poliamida', 179.99, 3, 100),
('Zapatillas deportivas running', 'Asics', 'US 10', 'Blanco', 'Sintético', 99.99, 4, 60),
('Classic', 'Vans', 'EU 42', 'Marrón', 'Cuero', 129.99, 4, 90),
('Jersey de lana cuello redondo', 'Gap', 'L', 'Gris', 'Lana', 49.99, 5, 100),
('Sudadera con capucha', 'Puma', 'M', 'Azul', 'Algodón', 59.99, 6, 60),
('Top corto escote bardot', 'Topshop', 'S', 'Negro', 'Poliéster', 34.99, 7, 90),
('Boxers', 'CalvinKlain', 'S', 'Negro', 'Algodón', 15.99, 8, 100),
('Shorts deportivos entrenamiento', 'Under Armour', 'L', 'Negro', 'Poliéster', 39.99, 9, 120),
('Abrigo de invierno acolchado', 'The North Face', 'M', 'Negro', 'Poliéster', 149.99, 10, 70),
('Abrigo acolchado ligero', 'Columbia', 'M', 'Negro', 'Poliéster', 119.99, 10, 60),
('Chaleco ligero senderismo', 'Decathlon', 'XL', 'Gris', 'Nailon', 29.99, 11, 50),
('Conjunto de ropa deportiva transpirable', 'Nike', 'M', 'Negro', 'Poliamida', 69.99, 12, 90);

INSERT INTO proveedor (nombre, direccion, telefono, NIF, correoElectronico, ciudadID) VALUES 
('BigBuy', 'Carrer dels Boters, 5, Valencia', '963475123', 'B12345678', 'info@bigbuy.eu', 3),
('BrandsDistribution', 'Calle Gran Vía, 45, Sevilla', '912345678', 'B23456789', 'info@brandsdistribution.com', 4),
('Griffati', 'Calle del Pilar, 22, Zaragoza', '987654321', 'C34567890', 'info@griffati.com', 5),
('SanMar', 'Avenida de la Industria, 10, Madrid', '915678432', 'D45678901', 'info@sanmar.com', 1),
('Merkandi', 'Calle del Comercio, 4, Barcelona', '934567890', 'E56789012', 'info@merkandi.com', 2),
('Foot Locker', 'Calle de Preciados, 9, Madrid', '917654321', 'F67890123', 'info@footlocker.com', 1),
('JD Sports', 'Carrer de Pelai, 52, Barcelona', '933215678', 'G78901234', 'info@jdsports.com', 2),
('Intersport', 'Calle de Goya, 15, Sevilla', '913456789', 'H89012345', 'info@intersport.es', 4),
('Nike Store', 'Calle de Serrano, 21, Madrid', '911234567', 'I90123456', 'info@nike.com', 1),
('Adidas Store', 'Calle de Alcalá, 19, Zaragoza', '914567890', 'J01234567', 'info@adidas.com', 5),
('Under Armour', 'Carrer de Balmes, 25, Málaga', '934567123', 'K12345678', 'info@underarmour.com', 6),
('Zara', 'Calle Gran Vía, 32, Murcia', '910234567', 'L23456789', 'info@zara.com', 7),
('The North Face', 'Calle de Claudio Coello, 53, Palma', '915123456', 'M34567890', 'info@thenorthface.com', 8),
('Vans Store', 'Calle de Fuencarral, 36, Las Palmas de Gran Canaria', '911567890', 'N45678901', 'info@vans.com', 9),
('Gap Store', 'Calle de Hermosilla, 48, Bilbao', '912345678', 'O56789012', 'info@gap.com', 10),
('Puma', 'Calle de Velázquez, 60, Alicante', '915280006', 'P12345678', 'info@puma.com', 11),
('Calvin Klein', 'Calle Alfonso XII, 15, Córdoba', '955912366', 'Q23456789', 'info@calvinklein.com', 12),
('Topshop', 'Avenida de Huelva, 5, Valladolid', '959470018', 'R34567890', 'info@topshop.com', 13),
('Columbia', 'Calle Feria, 19, Vigo', '955092094', 'S45678901', 'info@columbia.com', 14),
('Decathlon', 'Calle del Prado, 21, Gijón', '915215227', 'T56789012', 'info@decathlon.com', 15);

--INSERT TABLA TIENDA --
INSERT INTO tienda (nombre, direccion, telefono, horarioApertura, horarioCierre, numEmpleados, idCiudad) VALUES
('UrbanMadrid', 'Calle de Fuencarral 10, Madrid', 912345678, '09:00:00', '21:00:00', 15, 1),
('UrbanBarcelona', 'Passeig de Gràcia 45, Barcelona', 912345678, '9:00:00', '21:00:00', 15, 2),
('UrbanValencia', 'Calle Colón 20, Valencia', 912345678, '10:00:00', '20:00:00', 10, 3),
('UrbanSevilla', 'Avenida de la Constitución 15, Sevilla', 912345678, '10:00:00', '20:00:00', 10, 4),
('UrbanZaragoza', 'Paseo de la Independencia 25, Zaragoza', 991234567, '10:00:00', '20:00:00', 10, 5),
('UrbanMalaga', 'Calle Marqués de Larios 8, Málaga', 912345678, '10:00:00', '20:00:00', 10, 6),
('UrbanMurcia', 'Calle Mayor 15, Murcia', 934567890, '10:00:00', '20:00:00', 10, 7),
('UrbanPalma', 'Paseo Marítimo 30, Palma', 956789012, '10:00:00', '20:00:00', 10, 8),
('UrbanBilbao', 'Calle Elcano 10, Bilbao', 978901234, '10:00:00', '20:00:00', 10, 9),
('UrbanCordoba', 'Calle Góngora 25, Córdoba', 912345678, '10:00:00', '20:00:00', 10, 11),
('UrbanValladolid', 'Calle Santiago 12, Valladolid', 934567890, '10:00:00', '20:00:00', 10, 12),
('UrbanVigo', 'Calle García Barbón 19, Vigo', 956789012, '10:00:00', '20:00:00', 10, 13),
('UrbanGijon', 'Calle Corrida 7, Gijón', 978901234, '10:00:00', '20:00:00', 10, 14),
('UrbanCoruña', 'Calle Galera 15, La Coruña', 991234567, '10:00:00', '20:00:00', 10, 15),
('UrbanGranada', 'Calle de la Gran Vía 10, Granada', 912345678, '10:00:00', '20:00:00', 10, 16),
('UrbanOviedo', 'Calle Uria 5, Oviedo', 934567890, '10:00:00', '20:00:00', 10, 17),
('UrbanCartagena', 'Calle Mayor 20, Cartagena', 956789012, '10:00:00', '20:00:00', 10, 18),
('UrbanCanarias', 'Calle Triana 8, Gran Canaria', 978901234, '10:00:00', '20:00:00', 10, 19),
('UrbanMadrid1', 'Calle del Carmen 5, Madrid', 923456789, '09:00:00', '21:00:00', 15, 1),
('UrbanMadrid2', 'Calle de Velázquez 10, Madrid', 945678901, '09:00:00', '21:00:00', 15, 1),
('UrbanBarcelona1', 'Avinguda Diagonal 100, Barcelona', 987654321, '09:00:00', '21:00:00', 15, 2),
('UrbanBarcelona2', 'Rambla de Catalunya 50, Barcelona', 965874123, '09:00:00', '21:00:00', 15, 2),
('UrbanAlicante1', 'Calle de Alfonso X el Sabio 15, Alicante', 963258741, '10:00:00', '20:00:00', 10, 10),
('UrbanAlicante', 'Avenida de Maisonnave 18, Alicante', 991234567, '10:00:00', '20:00:00', 10, 10);

-- INSERTS TABLA EMPLEADOS --
INSERT INTO empleado (nombre, apellidos, fechaNac, direccion, fechaCont, cargo, salario, NUSS, idTienda) VALUES
('Carlos', 'García Martínez', '1990-03-15', 'Calle Mayor 10, Madrid', '2015-07-01', 'Encargado', 1400.00, 'ES123456789', 1),
('Laura', 'López García', '1985-05-20', 'Calle Fuencarral 25, Madrid', '2016-08-05', 'Encargado', 1400.00, 'ES234567890', 1),
('Javier', 'Martínez López', '1992-09-10', 'Calle Gran Vía 30, Madrid', '2017-07-15', 'Encargado', 1400.00, 'ES345678901', 1),
('María', 'González Fernández', '1988-12-03', 'Calle Serrano 40, Madrid', '2015-06-30', 'Encargado', 1400.00, 'ES456789012', 1),
('Daniel', 'Rodríguez Pérez', '1993-11-25', 'Calle Princesa 20, Madrid', '2016-07-10', 'Encargado', 1400.00, 'ES567890123', 1),
('Sara', 'Martínez Rodríguez', '1991-08-17', 'Calle Gran Vía 35, Madrid', '2015-06-25', 'Encargado', 1400.00, 'ES678901234', 1),
('Alejandro', 'Fernández López', '1994-02-08', 'Calle Alcalá 15, Madrid', '2017-08-20', 'Encargado', 1400.00, 'ES789012345', 1),
('Cristina', 'Sánchez Gómez', '1987-06-30', 'Calle Mayor 5, Madrid', '2015-07-05', 'Encargado', 1400.00, 'ES890123456', 1),
('Pedro', 'Pérez Martínez', '1990-09-12', 'Calle Atocha 12, Madrid', '2016-06-28', 'Encargado', 1400.00, 'ES901234567', 1),
('Ana', 'López Rodríguez', '1989-04-18', 'Calle Gran Vía 28, Madrid', '2018-08-10', 'Reponedor', 1250.00, 'ES012345678', 1),
('David', 'González Martínez', '1992-07-15', 'Calle Gran Vía 22, Madrid', '2016-06-25', 'Reponedor', 1250.00, 'ES987654321', 1),
('Elena', 'Martínez Pérez', '1988-04-30', 'Calle Mayor 12, Madrid', '2017-07-05', 'Reponedor', 1250.00, 'ES876543210', 1),
('Lucía', 'Fernández García', '1993-09-22', 'Calle Fuencarral 30, Madrid', '2015-06-30', 'Reponedor', 1250.00, 'ES765432109', 1),
('Marcos', 'Gómez Rodríguez', '1986-11-17', 'Calle Serrano 20, Madrid', '2016-07-15', 'Reponedor', 1250.00, 'ES654321098', 1),
('Carmen', 'Martín Sánchez', '1990-02-28', 'Calle Princesa 15, Madrid', '2017-08-01', 'Reponedor', 1250.00, 'ES543210987', 1),
('Miguel', 'González López', '1989-07-05', 'Calle Gran Vía 12, Madrid', '2015-06-22', 'Reponedor', 1250.00, 'ES432109876', 1),
('Paula', 'Sánchez Martínez', '1991-04-12', 'Calle Mayor 15, Madrid', '2016-07-08', 'Reponedor', 1250.00, 'ES321098765', 1),
('Jorge', 'Fernández Gómez', '1993-08-30', 'Calle Fuencarral 35, Madrid', '2018-08-05', 'Reponedor', 1250.00, 'ES210987654', 1),
('Eva', 'Rodríguez Martín', '1988-06-15', 'Calle Serrano 25, Madrid', '2017-06-28', 'Reponedor', 1250.00, 'ES109876543', 1),
('Alejandro', 'Martínez Gómez', '1990-09-20', 'Calle Princesa 18, Madrid', '2015-07-02', 'Reponedor', 1250.00, 'ES098765432', 1),
('Natalia', 'Gómez Rodríguez', '1987-03-25', 'Calle Gran Vía 18, Madrid', '2016-08-10', 'Reponedor', 1250.00, 'ES987654321', 1),
('Diego', 'Sánchez Pérez', '1994-05-10', 'Calle Mayor 18, Madrid', '2018-07-05', 'Reponedor', 1250.00, 'ES876543210', 1),
('Isabel', 'López Martínez', '1989-12-01', 'Calle Fuencarral 20, Madrid', '2018-06-30', 'Cajero', 1250.00, 'ES765432109', 1),
('Adrián', 'Martín Gómez', '1991-11-18', 'Calle Serrano 15, Madrid', '2016-07-15', 'Cajero', 1250.00, 'ES654321098', 1),
('Celia', 'Gómez López', '1993-10-05', 'Calle Gran Vía 10, Madrid', '2017-06-22', 'Cajero', 1250.00, 'ES543210987', 1),
('Roberto', 'Fernández Martínez', '1988-07-12', 'Calle Mayor 20, Madrid', '2015-07-08', 'Cajero', 1250.00, 'ES432109876', 1),
('Laura', 'Gómez Martínez', '1992-06-18', 'Calle Fuencarral 18, Madrid', '2016-07-02', 'Cajero', 1250.00, 'ES321098765', 1),
('Javier', 'Rodríguez Sánchez', '1990-04-25', 'Calle Serrano 10, Madrid', '2015-07-17', 'Cajero', 1250.00, 'ES210987654', 1),
('Sara', 'González Rodríguez', '1993-08-30', 'Calle Mayor 30, Madrid', '2016-06-24', 'Cajero', 1250.00, 'ES109876543', 1),
('Daniel', 'Martínez Gómez', '1989-12-05', 'Calle Fuencarral 12, Madrid', '2018-07-10', 'Cajero', 1250.00, 'ES098765432', 1),
('Ana', 'Gómez López', '1992-05-20', 'Calle Serrano 22, Madrid', '2015-06-26', 'Cajero', 1250.00, 'ES987654321', 1),
('Juan', 'Fernández Martínez', '1991-03-15', 'Calle Mayor 25, Madrid', '2015-07-12', 'Cajero', 1250.00, 'ES876543210', 1),
('María', 'López Rodríguez', '1987-09-10', 'Calle Fuencarral 25, Madrid', '2016-06-28', 'Cajero', 1250.00, 'ES765432109', 1),
('Pablo', 'Martínez Pérez', '1990-07-22', 'Calle Serrano 20, Madrid', '2018-07-15', 'Cajero', 1250.00, 'ES654321098', 1),
('Elena', 'González Sánchez', '1988-11-28', 'Calle Mayor 18, Madrid', '2017-06-30', 'Cajero', 1250.00, 'ES543210987', 1),
('Silvia', 'Fernández García', '1990-10-20', 'Carrer de Pau Claris 30, Barcelona', '2015-07-02', 'Encargado', 1400.00, 'ES765432109', 2),
('Javier', 'González Martínez', '1987-06-18', 'Carrer de Mallorca 32, Barcelona', '2015-08-05', 'Encargado', 1400.00, 'ES654321098', 2),
('Nuria', 'Martínez Gómez', '1993-03-22', 'Carrer de Balmes 18, Barcelona', '2015-07-15', 'Encargado', 1400.00, 'ES543210987', 2),
('Raul', 'Gómez López', '1988-09-12', 'Carrer de la Rambla 22, Barcelona', '2015-06-30', 'Encargado', 1400.00, 'ES432109876', 2),
('Elena', 'Martínez Rodríguez', '1991-08-30', 'Carrer de Balmes 20, Barcelona', '2015-07-10', 'Encargado', 1400.00, 'ES321098765', 2),
('Mario', 'López García', '1989-12-15', 'Carrer de Mallorca 38, Barcelona', '2015-06-25', 'Encargado', 1400.00, 'ES210987654', 2),
('Clara', 'Martínez Pérez', '1992-05-20', 'Carrer de la Rambla 25, Barcelona', '2015-08-10', 'Encargado', 1400.00, 'ES109876543', 2),
('Diego', 'Gómez Rodríguez', '1990-04-10', 'Carrer de Balmes 25, Barcelona', '2015-06-28', 'Encargado', 1400.00, 'ES098765432', 2),
('Sara', 'Martínez Martínez', '1987-07-05', 'Carrer de Mallorca 35, Barcelona', '2015-07-12', 'Encargado', 1400.00, 'ES987654321', 2),
('Javier', 'Fernández Pérez', '1994-09-10', 'Carrer de Balmes 28, Barcelona', '2015-06-28', 'Reponedor', 1250.00, 'ES876543210', 2),
('Natalia', 'Gómez Rodríguez', '1991-02-18', 'Carrer de la Rambla 30, Barcelona', '2015-07-15', 'Reponedor', 1250.00, 'ES765432109', 2),
('Miguel', 'Martínez García', '1988-11-23', 'Carrer de Mallorca 40, Barcelona', '2015-06-30', 'Reponedor', 1250.00, 'ES654321098', 2),
('Eva', 'López Martínez', '1993-06-20', 'Carrer de Balmes 32, Barcelona', '2015-07-02', 'Reponedor', 1250.00, 'ES543210987', 2),
('Carlos', 'García Pérez', '1989-04-15', 'Carrer de la Rambla 35, Barcelona', '2015-08-05', 'Reponedor', 1250.00, 'ES432109876', 2),
('Laura', 'Martínez Rodríguez', '1992-11-22', 'Carrer de Mallorca 45, Barcelona', '2015-07-15', 'Reponedor', 1250.00, 'ES321098765', 2),
('Pedro', 'Gómez López', '1988-07-12', 'Carrer de Balmes 40, Barcelona', '2015-06-30', 'Reponedor', 1250.00, 'ES210987654', 2),
('Sandra', 'Martínez Pérez', '1991-12-05', 'Carrer de la Rambla 38, Barcelona', '2015-07-10', 'Reponedor', 1250.00, 'ES109876543', 2),
('Adrián', 'Fernández García', '1990-09-17', 'Carrer de Mallorca 48, Barcelona', '2015-06-25', 'Reponedor', 1250.00, 'ES098765432', 2),
('Marina', 'Martínez Martínez', '1993-05-28', 'Carrer de Balmes 45, Barcelona', '2015-08-10', 'Reponedor', 1250.00, 'ES987654321', 2),
('Diego', 'Gómez Rodríguez', '1987-08-10', 'Carrer de la Rambla 40, Barcelona', '2015-06-28', 'Reponedor', 1250.00, 'ES876543210', 2),
('Natalia', 'Martínez García', '1990-02-18', 'Carrer de Mallorca 50, Barcelona', '2015-07-15', 'Reponedor', 1250.00, 'ES765432109', 2),
('Lucía', 'González Martínez', '1993-09-20', 'Carrer de Balmes 55, Barcelona', '2015-07-02', 'Reponedor', 1250.00, 'ES654321098', 2),
('Hugo', 'Martínez Gómez', '1988-11-15', 'Carrer de la Rambla 45, Barcelona', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 2),
('Clara', 'Gómez López', '1991-03-22', 'Carrer de Mallorca 55, Barcelona', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 2),
('Pablo', 'Martínez Rodríguez', '1987-05-10', 'Carrer de Balmes 50, Barcelona', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 2),
('Marina', 'Gómez Pérez', '1992-08-30', 'Carrer de la Rambla 50, Barcelona', '2015-07-10', 'Cajero', 1250.00, 'ES210987654', 2),
('Sergio', 'Martínez López', '1989-07-12', 'Carrer de Mallorca 60, Barcelona', '2015-06-25', 'Cajero', 1250.00, 'ES109876543', 2),
('Laura', 'García Pérez', '1994-04-05', 'Carrer de Balmes 60, Barcelona', '2015-08-10', 'Cajero', 1250.00, 'ES098765432', 2),
('Juan', 'Martínez Martínez', '1990-01-17', 'Carrer de la Rambla 55, Barcelona', '2015-06-28', 'Cajero', 1250.00, 'ES987654321', 2),
('Andrea', 'Gómez García', '1988-06-10', 'Carrer de Mallorca 65, Barcelona', '2015-07-15', 'Cajero', 1250.00, 'ES876543210', 2),
('Diego', 'Martínez Pérez', '1993-04-28', 'Carrer de Balmes 65, Barcelona', '2015-06-28', 'Cajero', 1250.00, 'ES765432109', 2),
('Lucía', 'García Rodríguez', '1987-12-10', 'Carrer de la Rambla 60, Barcelona', '2015-07-15', 'Cajero', 1250.00, 'ES654321098', 2),
('Héctor', 'Martínez Gómez', '1992-10-18', 'Carrer de Mallorca 70, Barcelona', '2015-06-30', 'Cajero', 1250.00, 'ES543210987', 2),
('Elena', 'García Martínez', '1989-03-28', 'Carrer de Balmes 70, Barcelona', '2015-08-10', 'Cajero', 1250.00, 'ES432109876', 2),
('Laura', 'García López', '1993-09-20', 'Calle de la Paz 10, Valencia', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 3),
('Daniel', 'Martínez Sánchez', '1988-11-15', 'Calle de San Vicente 15, Valencia', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 3),
('Sofía', 'García Fernández', '1991-03-22', 'Calle de Xátiva 20, Valencia', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 3),
('Mario', 'Martínez Pérez', '1987-05-10', 'Calle de Ribera 25, Valencia', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 3),
('Elena', 'García Martínez', '1992-08-30', 'Calle de las Barcas 30, Valencia', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 3),
('Pablo', 'Martínez López', '1989-07-12', 'Calle de la Reina 35, Valencia', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 3),
('Lucía', 'García Pérez', '1993-05-28', 'Calle de la Paz II 40, Valencia', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 3),
('Carlos', 'Martínez Martínez', '1987-12-05', 'Calle de Colón 45, Valencia', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 3),
('Sara', 'García Sánchez', '1990-01-17', 'Calle de las Serranos 50, Valencia', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 3),
('Juan', 'Martínez Rodríguez', '1992-10-18', 'Calle de la Sangre 55, Valencia', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 3),
('María', 'García López', '1993-09-20', 'Calle Sierpes 10, Sevilla', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 4),
('David', 'Martínez Sánchez', '1988-11-15', 'Calle Tetuán 15, Sevilla', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 4),
('Ana', 'García Fernández', '1991-03-22', 'Avenida de la Constitución 20, Sevilla', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 4),
('Pablo', 'Martínez Pérez', '1987-05-10', 'Calle Regina 25, Sevilla', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 4),
('Lucía', 'García Martínez', '1992-08-30', 'Calle Sierpes II 30, Sevilla', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 4),
('Javier', 'Martínez López', '1989-07-12', 'Calle Feria 35, Sevilla', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 4),
('Sara', 'García Pérez', '1993-05-28', 'Calle Mateos Gago 40, Sevilla', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 4),
('Carlos', 'Martínez Martínez', '1987-12-05', 'Calle Francos 45, Sevilla', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 4),
('Elena', 'García Sánchez', '1990-01-17', 'Calle Sierpes III 50, Sevilla', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 4),
('Juan', 'Martínez Rodríguez', '1992-10-18', 'Calle Almirante Apodaca 55, Sevilla', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 4),
('María', 'García López', '1993-09-20', 'Calle Alfonso 10, Zaragoza', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 5),
('David', 'Martínez Sánchez', '1988-11-15', 'Calle Don Jaime 15, Zaragoza', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 5),
('Ana', 'García Fernández', '1991-03-22', 'Calle Alfonso I 20, Zaragoza', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 5),
('Pablo', 'Martínez Pérez', '1987-05-10', 'Calle Delicias 25, Zaragoza', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 5),
('Lucía', 'García Martínez', '1992-08-30', 'Paseo Independencia 30, Zaragoza', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 5),
('Javier', 'Martínez López', '1989-07-12', 'Calle Don Jaime I 35, Zaragoza', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 5),
('Sara', 'García Pérez', '1993-05-28', 'Paseo de la Independencia 40, Zaragoza', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 5),
('Carlos', 'Martínez Martínez', '1987-12-05', 'Calle Alfonso 45, Zaragoza', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 5),
('Elena', 'García Sánchez', '1990-01-17', 'Calle Alfonso II 50, Zaragoza', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 5),
('Juan', 'Martínez Rodríguez', '1992-10-18', 'Calle Coso 55, Zaragoza', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 5),
('María', 'García López', '1993-09-20', 'Calle Larios 10, Málaga', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 6),
('David', 'Martínez Sánchez', '1988-11-15', 'Calle Compañía 15, Málaga', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 6),
('Ana', 'García Fernández', '1991-03-22', 'Calle Granada 20, Málaga', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 6),
('Pablo', 'Martínez Pérez', '1987-05-10', 'Calle Carretería 25, Málaga', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 6),
('Lucía', 'García Martínez', '1992-08-30', 'Calle Marqués de Larios 30, Málaga', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 6),
('Javier', 'Martínez López', '1989-07-12', 'Calle Nueva 35, Málaga', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 6),
('Sara', 'García Pérez', '1993-05-28', 'Calle San Agustín 40, Málaga', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 6),
('Carlos', 'Martínez Martínez', '1987-12-05', 'Calle Granada 45, Málaga', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 6),
('Elena', 'García Sánchez', '1990-01-17', 'Calle Larios 50, Málaga', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 6),
('Juan', 'Martínez Rodríguez', '1992-10-18', 'Calle Nueva 55, Málaga', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 6),
('María', 'García López', '1993-09-20', 'Calle de la Paz 10, Murcia', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 7),
('David', 'Martínez Sánchez', '1988-11-15', 'Calle del Carmen 15, Murcia', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 7),
('Ana', 'García Fernández', '1991-03-22', 'Calle Mayor 20, Murcia', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 7),
('Pablo', 'Martínez Pérez', '1987-05-10', 'Calle Trapería 25, Murcia', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 7),
('Lucía', 'García Martínez', '1992-08-30', 'Calle Platería 30, Murcia', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 7),
('Javier', 'Martínez López', '1989-07-12', 'Calle Jabonerías 35, Murcia', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 7),
('Sara', 'García Pérez', '1993-05-28', 'Calle de los Apóstoles 40, Murcia', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 7),
('Carlos', 'Martínez Martínez', '1987-12-05', 'Calle Riquelme 45, Murcia', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 7),
('Elena', 'García Sánchez', '1990-01-17', 'Calle Plateria 50, Murcia', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 7),
('Juan', 'Martínez Rodríguez', '1992-10-18', 'Calle Jara Carrillo 55, Murcia', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 7),
('Marina', 'Martínez López', '1993-09-20', 'Carrer de Jaume Balmes 10, Palma', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 8),
('Diego', 'García Martínez', '1988-11-15', 'Carrer de Guillem Massot 15, Palma', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 8),
('Luna', 'Martínez García', '1991-03-22', 'Carrer de Josep Villalonga 20, Palma', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 8),
('Hugo', 'García Martínez', '1987-05-10', 'Carrer de Francisco Martorell Oliver 25, Palma', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 8),
('Aitana', 'García Martínez', '1992-08-30', 'Carrer de Joan Crespi 30, Palma', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 8),
('Sergio', 'Martínez García', '1989-07-12', 'Carrer de Francesc Fiol i Joan 35, Palma', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 8),
('Lucía', 'García Martínez', '1993-05-28', 'Carrer de Jeroni Alomar 40, Palma', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 8),
('Mateo', 'Martínez García', '1987-12-05', 'Carrer de Ramon Berenguer III 45, Palma', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 8),
('Elena', 'García Martínez', '1990-01-17', 'Carrer de Jaume II 50, Palma', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 8),
('Santiago', 'Martínez García', '1992-10-18', 'Carrer del Sindicat 55, Palma', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 8),
('Ainhoa', 'García López', '1993-09-20', 'Calle de Ercilla 10, Bilbao', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 9),
('Iker', 'Martínez Sánchez', '1988-11-15', 'Calle de Gran Vía 15, Bilbao', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 9),
('Leire', 'García Fernández', '1991-03-22', 'Calle de Autonomía 20, Bilbao', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 9),
('Asier', 'Martínez Pérez', '1987-05-10', 'Calle de Alameda de Urquijo 25, Bilbao', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 9),
('Maite', 'García Martínez', '1992-08-30', 'Calle de San Francisco 30, Bilbao', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 9),
('Jon', 'Martínez López', '1989-07-12', 'Calle de Rodríguez Arias 35, Bilbao', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 9),
('Izaro', 'García Pérez', '1993-05-28', 'Calle de Sabino Arana 40, Bilbao', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 9),
('Unai', 'Martínez Martínez', '1987-12-05', 'Calle de Licenciado Poza 45, Bilbao', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 9),
('Irati', 'García Sánchez', '1990-01-17', 'Calle de Hurtado de Amézaga 50, Bilbao', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 9),
('Gorka', 'Martínez Rodríguez', '1992-10-18', 'Calle de Euskalduna 55, Bilbao', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 9),
('María', 'García López', '1993-09-20', 'Calle de la Concha 10, Córdoba', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 11),
('Javier', 'Martínez Sánchez', '1988-11-15', 'Calle del Conde de Torres Cabrera 15, Córdoba', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 11),
('Sara', 'García Fernández', '1991-03-22', 'Calle del Duque de Hornachuelos 20, Córdoba', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 11),
('Antonio', 'Martínez Pérez', '1987-05-10', 'Calle de la Fuenseca 25, Córdoba', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 11),
('Lucía', 'García Martínez', '1992-08-30', 'Calle de María Auxiliadora 30, Córdoba', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 11),
('David', 'Martínez López', '1989-07-12', 'Calle de la Cruz Conde 35, Córdoba', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 11),
('Elena', 'García Pérez', '1993-05-28', 'Calle del Conde de Gondomar 40, Córdoba', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 11),
('Alejandro', 'Martínez Martínez', '1987-12-05', 'Calle de la Cruz del Rastro 45, Córdoba', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 11),
('Laura', 'García Sánchez', '1990-01-17', 'Calle de San Pablo 50, Córdoba', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 11),
('Manuel', 'Martínez Rodríguez', '1992-10-18', 'Calle del Arzobispo Castro 55, Córdoba', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 11),
('María', 'García López', '1993-09-20', 'Calle de la Concha 10, Córdoba', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 11),
('Javier', 'Martínez Sánchez', '1988-11-15', 'Calle del Conde de Torres Cabrera 15, Córdoba', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 11),
('Sara', 'García Fernández', '1991-03-22', 'Calle del Duque de Hornachuelos 20, Córdoba', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 11),
('Antonio', 'Martínez Pérez', '1987-05-10', 'Calle de la Fuenseca 25, Córdoba', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 11),
('Lucía', 'García Martínez', '1992-08-30', 'Calle de María Auxiliadora 30, Córdoba', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 11),
('David', 'Martínez López', '1989-07-12', 'Calle de la Cruz Conde 35, Córdoba', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 11),
('Elena', 'García Pérez', '1993-05-28', 'Calle del Conde de Gondomar 40, Córdoba', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 11),
('Alejandro', 'Martínez Martínez', '1987-12-05', 'Calle de la Cruz del Rastro 45, Córdoba', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 11),
('Laura', 'García Sánchez', '1990-01-17', 'Calle de San Pablo 50, Córdoba', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 11),
('Manuel', 'Martínez Rodríguez', '1992-10-18', 'Calle del Arzobispo Castro 55, Córdoba', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 11),
('Juan', 'González Pérez', '1990-03-12', 'Calle de las Angustias 15, Valladolid', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 12),
('María', 'Martínez Rodríguez', '1988-08-25', 'Calle de las Platerías 20, Valladolid', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 12),
('Pedro', 'López García', '1993-04-30', 'Calle de la Universidad 25, Valladolid', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 12),
('Ana', 'Fernández López', '1989-11-15', 'Calle de la Platería Vieja 30, Valladolid', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 12),
('Carlos', 'Martín Pérez', '1991-06-20', 'Calle de la Acera de Recoletos 35, Valladolid', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 12),
('Laura', 'García Martínez', '1990-09-05', 'Calle de las Angustias 40, Valladolid', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 12),
('David', 'Sánchez Rodríguez', '1992-07-10', 'Calle de la Universidad 45, Valladolid', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 12),
('Marta', 'Pérez García', '1987-05-28', 'Calle de las Platerías 50, Valladolid', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 12),
('Javier', 'Fernández Martín', '1993-02-15', 'Calle de la Universidad 55, Valladolid', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 12),
('Sara', 'Martínez Sánchez', '1988-10-20', 'Calle de las Platerías 60, Valladolid', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 12),
('Antonio', 'García Pérez', '1992-03-18', 'Calle de Pizarro 12, Vigo', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 13),
('María', 'Rodríguez Martínez', '1989-08-22', 'Calle de López Mora 20, Vigo', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 13),
('Pedro', 'Fernández Gómez', '1994-04-25', 'Avenida de Madrid 15, Vigo', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 13),
('Ana', 'López Rodríguez', '1990-11-10', 'Calle de la Paz 30, Vigo', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 13),
('Carlos', 'Martínez García', '1991-06-15', 'Avenida de Europa 25, Vigo', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 13),
('Laura', 'Gómez Rodríguez', '1993-09-30', 'Calle de Urzáiz 40, Vigo', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 13),
('David', 'Rodríguez Martín', '1992-07-05', 'Calle de Colón 45, Vigo', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 13),
('Marta', 'García Pérez', '1988-05-20', 'Calle de Pizarro 50, Vigo', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 13),
('Javier', 'Fernández López', '1993-02-10', 'Avenida de Europa 55, Vigo', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 13),
('Sara', 'Martínez Gómez', '1987-10-25', 'Calle de López Mora 60, Vigo', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 13),
('Pablo', 'García Martínez', '1990-03-18', 'Calle de Mariano Pola 12, Gijón', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 14),
('Elena', 'Martínez Rodríguez', '1988-08-22', 'Calle de Manuel Pedregal 20, Gijón', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 14),
('Diego', 'Fernández Gómez', '1993-04-25', 'Avenida de la Costa 15, Gijón', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 14),
('Laura', 'Rodríguez Pérez', '1992-11-10', 'Calle de Covadonga 30, Gijón', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 14),
('Marcos', 'Martínez García', '1991-06-15', 'Avenida de los Campones 25, Gijón', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 14),
('Carmen', 'Gómez Rodríguez', '1993-09-30', 'Calle de Manuel Pedregal 40, Gijón', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 14),
('Javier', 'Rodríguez Martín', '1992-07-05', 'Calle de Manuel Pedregal 45, Gijón', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 14),
('Sara', 'García Pérez', '1988-05-20', 'Calle de Manuel Pedregal 50, Gijón', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 14),
('David', 'Fernández López', '1993-02-10', 'Calle de Manuel Pedregal 55, Gijón', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 14),
('Eva', 'Martínez Gómez', '1987-10-25', 'Calle de Manuel Pedregal 60, Gijón', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 14),
('Carlos', 'González López', '1992-04-15', 'Calle de la Torre 12, La Coruña', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 15),
('María', 'Martínez García', '1989-08-18', 'Calle de la Ronda 20, La Coruña', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 15),
('Juan', 'Rodríguez Pérez', '1993-05-25', 'Calle del Parrote 15, La Coruña', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 15),
('Laura', 'Fernández Gómez', '1990-11-10', 'Calle de la Torre 30, La Coruña', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 15),
('Sergio', 'García Martínez', '1991-06-15', 'Calle de la Ronda 25, La Coruña', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 15),
('Ana', 'Martínez Rodríguez', '1993-09-30', 'Calle de la Torre 40, La Coruña', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 15),
('Pedro', 'Rodríguez Martín', '1992-07-05', 'Calle del Parrote 45, La Coruña', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 15),
('Eva', 'García Pérez', '1988-05-20', 'Calle de la Ronda 50, La Coruña', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 15),
('Miguel', 'Martínez López', '1993-02-10', 'Calle de la Torre 55, La Coruña', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 15),
('Laura', 'Fernández Gómez', '1987-10-25', 'Calle de la Ronda 60, La Coruña', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 15),
('Sara', 'García Martínez', '1990-03-15', 'Calle de la Gran Vía 10, Granada', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 16),
('Daniel', 'Martínez López', '1991-08-18', 'Calle de los Reyes Católicos 20, Granada', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 16),
('Lucía', 'González Pérez', '1993-05-25', 'Calle de la Fuente 15, Granada', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 16),
('Carlos', 'García Gómez', '1990-11-10', 'Calle de la Plaza 30, Granada', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 16),
('Laura', 'Martínez Martín', '1991-06-15', 'Calle de la Alhambra 25, Granada', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 16),
('Manuel', 'González Rodríguez', '1993-09-30', 'Calle de la Catedral 40, Granada', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 16),
('María', 'García Martínez', '1992-07-05', 'Calle del Albaicín 45, Granada', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 16),
('Pablo', 'Martínez Pérez', '1988-05-20', 'Calle de la Alpujarra 50, Granada', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 16),
('Ana', 'García López', '1993-02-10', 'Calle de la Sierra Nevada 55, Granada', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 16),
('Javier', 'Martínez Pérez', '1987-10-25', 'Calle de la Vega 60, Granada', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 16),
('Marcos', 'González Martínez', '1990-04-15', 'Calle Uria 10, Oviedo', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 17),
('Carmen', 'Fernández García', '1991-09-18', 'Calle Jovellanos 20, Oviedo', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 17),
('Daniel', 'López Rodríguez', '1993-06-25', 'Calle San Francisco 15, Oviedo', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 17),
('Ana', 'Martínez Fernández', '1990-12-10', 'Calle Santa Susana 30, Oviedo', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 17),
('Sergio', 'García Pérez', '1991-07-15', 'Calle San Francisco 25, Oviedo', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 17),
('Laura', 'Martínez Rodríguez', '1993-10-30', 'Calle Argüelles 40, Oviedo', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 17),
('Juan', 'González López', '1992-08-05', 'Calle Santa Susana 45, Oviedo', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 17),
('Lucía', 'Martínez Martínez', '1988-06-20', 'Calle Uria 50, Oviedo', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 17),
('Pedro', 'García Rodríguez', '1993-03-10', 'Calle Jovellanos 55, Oviedo', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 17),
('Elena', 'Martínez García', '1987-11-25', 'Calle Argüelles 60, Oviedo', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 17),
('Antonio', 'Sánchez Martínez', '1992-04-15', 'Calle Mayor 10, Cartagena', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 18),
('María', 'García Fernández', '1991-09-18', 'Calle del Carmen 20, Cartagena', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 18),
('José', 'Martínez Rodríguez', '1993-06-25', 'Avenida Juan Carlos I 15, Cartagena', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 18),
('Ana', 'Fernández Pérez', '1990-12-10', 'Calle del Parque 30, Cartagena', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 18),
('David', 'González Sánchez', '1991-07-15', 'Calle Real 25, Cartagena', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 18),
('Laura', 'Rodríguez Martínez', '1993-10-30', 'Plaza España 40, Cartagena', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 18),
('Manuel', 'Pérez Gómez', '1992-08-05', 'Calle Santa Florentina 45, Cartagena', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 18),
('Cristina', 'Martín López', '1988-06-20', 'Calle Gisbert 50, Cartagena', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 18),
('Francisco', 'Gómez Rodríguez', '1993-03-10', 'Calle de los Artilleros 55, Cartagena', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 18),
('Isabel', 'López Martínez', '1987-11-25', 'Avenida del Cantón 60, Cartagena', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 18),
('Pablo', 'Sánchez Gómez', '1990-05-12', 'Calle Mayor 10, Alicante', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 19),
('Marina', 'García Martínez', '1992-09-15', 'Calle del Carmen 20, Alicante', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 19),
('Javier', 'Martínez López', '1993-06-20', 'Avenida Juan Carlos I 15, Alicante', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 19),
('Laura', 'Fernández Pérez', '1991-12-10', 'Calle del Parque 30, Alicante', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 19),
('Daniel', 'González Sánchez', '1991-07-15', 'Calle Real 25, Alicante', '2015-06-24', 'Cajero', 1250.00, 'ES567890123', 19),
('Natalia', 'Rodríguez Martínez', '1993-10-30', 'Plaza España 40, Alicante', '2015-06-29', 'Cajero', 1250.00, 'ES678901234', 19),
('Alejandro', 'Pérez Gómez', '1992-08-05', 'Calle Santa Florentina 45, Alicante', '2015-06-22', 'Cajero', 1250.00, 'ES789012345', 19),
('Sara', 'Martín López', '1988-06-20', 'Calle Gisbert 50, Alicante', '2015-07-05', 'Cajero', 1250.00, 'ES890123456', 19),
('Iván', 'Gómez Rodríguez', '1993-03-10', 'Calle de los Artilleros 55, Alicante', '2015-06-23', 'Cajero', 1250.00, 'ES901234567', 19),
('Carlos', 'Sánchez Martínez', '1990-05-12', 'Calle Mayor 15, Alicante', '2015-06-21', 'Reponedor', 1250.00, 'ES123456789', 19),
('Paula', 'García Martínez', '1992-09-15', 'Calle del Carmen 25, Alicante', '2015-06-25', 'Reponedor', 1250.00, 'ES234567890', 19),
('Pedro', 'Martínez López', '1993-06-20', 'Avenida Juan Carlos I 20, Alicante', '2015-06-28', 'Reponedor', 1250.00, 'ES345678901', 19),
('Elena', 'Fernández Pérez', '1991-12-10', 'Calle del Parque 35, Alicante', '2015-07-01', 'Reponedor', 1250.00, 'ES456789012', 19),
('Juan', 'González Sánchez', '1991-07-15', 'Calle Real 30, Alicante', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 19),
('María', 'Rodríguez Martínez', '1993-10-30', 'Plaza España 45, Alicante', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 19),
('Jorge', 'Pérez Gómez', '1992-08-05', 'Calle Santa Florentina 50, Alicante', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 19),
('Ana', 'Martín López', '1988-06-20', 'Calle Gisbert 55, Alicante', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 19),
('Mario', 'Gómez Rodríguez', '1993-03-10', 'Calle de los Artilleros 60, Alicante', '2015-06-23', 'Reponedor', 1250.00, 'ES901234567', 19),
('Carlos', 'Hernández Pérez', '1985-05-15', 'Calle Mayor 20, Alicante', '2015-06-20', 'Encargado', 1400.00, 'ES123456789', 10),
('Laura', 'García Martínez', '1986-09-28', 'Avenida del Puerto 25, Alicante', '2015-06-19', 'Encargado', 1400.00, 'ES234567890', 10);

	INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 1, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 2, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 3, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 4, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 5, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 6, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 7, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 8, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 9, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 10, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 11, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 12, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 13, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 14, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 15, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 16, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 17, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 18, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 19, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 20, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 21, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 22, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 23, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (1, 24, 2);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 1, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 2, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 3, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 4, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 5, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 6, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 7, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 8, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 9, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 10, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 11, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 12, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 13, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 14, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 15, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 16, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 17, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 18, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 19, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 20, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 21, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 22, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 23, 10);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (2, 24, 10);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 1, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 2, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 3, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 4, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 5, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 6, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 7, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 8, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 9, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 10, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 11, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 12, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 13, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 14, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 15, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 16, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 17, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 18, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 19, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (3, 20, 2);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 1, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 2, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 3, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 4, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 5, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 6, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 7, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 8, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 9, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 10, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 11, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 12, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 13, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 14, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 15, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 16, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 17, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 18, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 19, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 20, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 21, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 22, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 23, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (4, 24, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 1, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 2, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 3, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 4, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 5, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 6, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 7, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 8, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 9, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 10, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 11, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 12, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 13, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 14, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 15, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 16, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 17, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 18, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 19, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 20, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 21, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 22, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 23, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (5, 24, 2);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 1, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 2, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 3, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 4, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 5, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 6, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 7, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 8, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 9, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 10, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 11, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 12, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 13, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 14, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 15, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 16, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 20, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 21, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 22, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 23, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (6, 24, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 1, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 2, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 3, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 4, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 5, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 6, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 7, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 8, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 9, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 10, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 11, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 12, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 13, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 14, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 15, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 16, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 17, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 18, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 19, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (7, 20, 5);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 1, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 2, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 3, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 4, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 5, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 6, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 7, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 8, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 9, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 10, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 11, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 12, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 13, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 14, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 15, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 16, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 17, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 18, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 19, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (8, 20, 3);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 1, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 2, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 3, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 4, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 5, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 6, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 7, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 8, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 9, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 10, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 11, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 12, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 13, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 14, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 15, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 16, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (9, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 1, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 2, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 3, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 4, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 5, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 6, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 7, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 8, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 9, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 10, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 11, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 12, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 13, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 14, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 15, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 16, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (10, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 1, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 2, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 3, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 4, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 5, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 6, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 7, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 8, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 9, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 10, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 11, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 12, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 13, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 14, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 15, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 16, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (11, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 1, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 2, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 3, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 4, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 5, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 6, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 7, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 8, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 9, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 10, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 11, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 12, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 13, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 14, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 15, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 16, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 17, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 18, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 19, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (12, 20, 2);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 1, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 2, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 3, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 4, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 5, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 6, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 7, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 8, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 9, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 10, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 11, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 12, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 13, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 14, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 15, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 16, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (13, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 1, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 2, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 3, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 4, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 5, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 6, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 7, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 8, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 9, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 10, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 11, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 12, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 13, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 14, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 15, 6);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 16, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 17, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 18, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 19, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (14, 20, 2);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 1, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 2, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 3, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 4, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 5, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 6, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 7, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 8, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 9, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 10, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 11, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 12, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 13, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 14, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 15, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 16, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (15, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 1, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 2, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 3, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 4, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 5, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 6, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 7, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 8, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 9, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 10, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 11, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 12, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 13, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 14, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 15, 3);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 16, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 17, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (16, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 1, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 2, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 3, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 4, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 5, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 6, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 7, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 8, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 9, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 10, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 11, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 12, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 13, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 14, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 15, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 16, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 17, 2);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 18, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 19, 1);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (17, 20, 1);

-----------------------------------------------------------------------------------

INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 1, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 2, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 3, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 4, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 5, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 6, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 7, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 8, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 9, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 10, 4);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 11, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 12, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 13, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 14, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 15, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 16, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 17, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 18, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 19, 5);
INSERT INTO productoTienda (productoID, tiendaID, cantidad) VALUES (18, 20, 5);