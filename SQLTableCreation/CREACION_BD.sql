CREATE DATABASE Urbanessence;
GO

USE Urbanessence;
GO

-- TABLAS CREADAS POR KEVIN --
-- CREACI�N DE LA TABLA CLIENTE --
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
-- CREACI�N DE LA TABLA TIPO --
CREATE TABLE tipo(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(20) NOT NULL,

	CONSTRAINT pk_tipo PRIMARY KEY(id)
);

-- TABLAS CREADAS POR DANIEL --
-- CREACI�N DE LA TABLA CIUDAD --
CREATE TABLE ciudad(
	id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	provincia VARCHAR(50) NOT NULL,
	numHabitantes INT NOT NULL,

	CONSTRAINT PK_Ciudad PRIMARY KEY(id)
);

-- TABLAS CREADAS POR DANIEL --
-- CREACI�N DE LA TABLA TIENDA --
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
-- CREACI�N DE LA TABLA EMPLEADO --
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
-- CREACI�N DE LA TABLA PRODUCTO --
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
-- CREACI�N DE LA TABLA PROVEEDOR --
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
-- CREACI�N DE LA TABLA PEDIDO --
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
-- CREACI�N DE LA TABLA pedidoProducto --
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
-- CREACI�N DE LA TABLA productoPerteneceTienda --
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
('Ropa�de�deporte');

--INSERTS TABLA CIUDAD--
INSERT INTO ciudad (nombre, provincia, numHabitantes) VALUES
('Madrid', 'Madrid', 3200000),
('Barcelona', 'Barcelona', 1600000),
('Valencia', 'Valencia', 800000),
('Sevilla', 'Sevilla', 690000),
('Zaragoza', 'Zaragoza', 680000),
('M�laga', 'M�laga', 570000),
('Murcia', 'Murcia', 450000),
('Palma', 'Islas Baleares', 410000),
('Las Palmas de Gran Canaria', 'Las Palmas', 380000),
('Bilbao', 'Vizcaya', 350000),
('Alicante', 'Alicante', 340000),
('C�rdoba', 'C�rdoba', 330000),
('Valladolid', 'Valladolid', 310000),
('Vigo', 'Pontevedra', 300000),
('Gij�n', 'Asturias', 280000),
('La Coru�a', 'La Coru�a', 246000),
('Granada', 'Granada', 240000),
('Oviedo', 'Asturias', 220000),
('Cartagena', 'Murcia', 210000);

INSERT INTO producto (nombre, marca, talla, color, material, precio, idTipo, cantidad) VALUES 
('Camiseta algod�n', 'Nike', 'M', 'Negro', 'Algod�n', 29.99, 1, 150),
('Camiseta estampada ', 'Adidas', 'L', 'Azul', 'Algod�n', 24.99, 1, 300),
('Camisa de algod�n a cuadros', 'Tommy Hilfiger', 'L', 'Azul y Blanco', 'Algod�n', 49.99, 1, 40),
('Pantal�n vaquero slim fit', 'Wrangler', '32', 'Negro', 'Denim', 69.99, 2, 50),
('Pantal�n deportivo transpirable', 'Under Armour', 'XL', 'Negro', 'Poli�ster', 49.99, 2, 80),
('Chaqueta de cuero genuino', 'Zara', 'M', 'Negro', 'Cuero', 149.99, 3, 40),
('Chaqueta acolchada impermeable', 'The North Face', 'L', 'Gris', 'Poliamida', 179.99, 3, 100),
('Zapatillas deportivas running', 'Asics', 'US 10', 'Blanco', 'Sint�tico', 99.99, 4, 60),
('Classic', 'Vans', 'EU 42', 'Marr�n', 'Cuero', 129.99, 4, 90),
('Jersey de lana cuello redondo', 'Gap', 'L', 'Gris', 'Lana', 49.99, 5, 100),
('Sudadera con capucha', 'Puma', 'M', 'Azul', 'Algod�n', 59.99, 6, 60),
('Top corto escote bardot', 'Topshop', 'S', 'Negro', 'Poli�ster', 34.99, 7, 90),
('Boxers', 'CalvinKlain', 'S', 'Negro', 'Algod�n', 15.99, 8, 100),
('Shorts deportivos entrenamiento', 'Under Armour', 'L', 'Negro', 'Poli�ster', 39.99, 9, 120),
('Abrigo de invierno acolchado', 'The North Face', 'M', 'Negro', 'Poli�ster',�149.99,�10, 70),
('Abrigo acolchado ligero', 'Columbia', 'M', 'Negro', 'Poli�ster', 119.99, 10, 60),
('Chaleco ligero senderismo', 'Decathlon', 'XL', 'Gris', 'Nailon', 29.99, 11, 50),
('Conjunto de ropa deportiva transpirable', 'Nike', 'M', 'Negro', 'Poliamida', 69.99, 12, 90);

INSERT INTO proveedor (nombre, direccion, telefono, NIF, correoElectronico, ciudadID) VALUES 
('BigBuy', 'Carrer dels Boters, 5, Valencia', '963475123', 'B12345678', 'info@bigbuy.eu', 3),
('BrandsDistribution', 'Calle Gran V�a, 45, Sevilla', '912345678', 'B23456789', 'info@brandsdistribution.com', 4),
('Griffati', 'Calle del Pilar, 22, Zaragoza', '987654321', 'C34567890', 'info@griffati.com', 5),
('SanMar', 'Avenida de la Industria, 10, Madrid', '915678432', 'D45678901', 'info@sanmar.com', 1),
('Merkandi', 'Calle del Comercio, 4, Barcelona', '934567890', 'E56789012', 'info@merkandi.com', 2),
('Foot Locker', 'Calle de Preciados, 9, Madrid', '917654321', 'F67890123', 'info@footlocker.com', 1),
('JD Sports', 'Carrer de Pelai, 52, Barcelona', '933215678', 'G78901234', 'info@jdsports.com', 2),
('Intersport', 'Calle de Goya, 15, Sevilla', '913456789', 'H89012345', 'info@intersport.es', 4),
('Nike Store', 'Calle de Serrano, 21, Madrid', '911234567', 'I90123456', 'info@nike.com', 1),
('Adidas Store', 'Calle de Alcal�, 19, Zaragoza', '914567890', 'J01234567', 'info@adidas.com', 5),
('Under Armour', 'Carrer de Balmes, 25, M�laga', '934567123', 'K12345678', 'info@underarmour.com', 6),
('Zara', 'Calle Gran V�a, 32, Murcia', '910234567', 'L23456789', 'info@zara.com', 7),
('The North Face', 'Calle de Claudio Coello, 53, Palma', '915123456', 'M34567890', 'info@thenorthface.com', 8),
('Vans Store', 'Calle de Fuencarral, 36, Las Palmas de Gran Canaria', '911567890', 'N45678901', 'info@vans.com', 9),
('Gap Store', 'Calle de Hermosilla, 48, Bilbao', '912345678', 'O56789012', 'info@gap.com', 10),
('Puma', 'Calle de Vel�zquez, 60, Alicante', '915280006', 'P12345678', 'info@puma.com', 11),
('Calvin Klein', 'Calle Alfonso XII, 15, C�rdoba', '955912366', 'Q23456789', 'info@calvinklein.com', 12),
('Topshop', 'Avenida de Huelva, 5, Valladolid', '959470018', 'R34567890', 'info@topshop.com', 13),
('Columbia', 'Calle Feria, 19, Vigo', '955092094', 'S45678901', 'info@columbia.com', 14),
('Decathlon', 'Calle del Prado, 21, Gij�n', '915215227', 'T56789012', 'info@decathlon.com', 15);

--INSERT TABLA TIENDA --
INSERT INTO tienda (nombre, direccion, telefono, horarioApertura, horarioCierre, numEmpleados, idCiudad) VALUES
('UrbanMadrid', 'Calle de Fuencarral 10, Madrid', 912345678, '09:00:00', '21:00:00', 15, 1),
('UrbanBarcelona', 'Passeig de Gr�cia 45, Barcelona', 912345678, '9:00:00', '21:00:00', 15, 2),
('UrbanValencia', 'Calle Col�n 20, Valencia', 912345678, '10:00:00', '20:00:00', 10, 3),
('UrbanSevilla', 'Avenida de la Constituci�n 15, Sevilla', 912345678, '10:00:00', '20:00:00', 10, 4),
('UrbanZaragoza', 'Paseo de la Independencia 25, Zaragoza', 991234567, '10:00:00', '20:00:00', 10, 5),
('UrbanMalaga', 'Calle Marqu�s de Larios 8, M�laga', 912345678, '10:00:00', '20:00:00', 10, 6),
('UrbanMurcia', 'Calle Mayor 15, Murcia', 934567890, '10:00:00', '20:00:00', 10, 7),
('UrbanPalma', 'Paseo Mar�timo 30, Palma', 956789012, '10:00:00', '20:00:00', 10, 8),
('UrbanBilbao', 'Calle Elcano 10, Bilbao', 978901234, '10:00:00', '20:00:00', 10, 9),
('UrbanCordoba', 'Calle G�ngora 25, C�rdoba', 912345678, '10:00:00', '20:00:00', 10, 11),
('UrbanValladolid', 'Calle Santiago 12, Valladolid', 934567890, '10:00:00', '20:00:00', 10, 12),
('UrbanVigo', 'Calle Garc�a Barb�n 19, Vigo', 956789012, '10:00:00', '20:00:00', 10, 13),
('UrbanGijon', 'Calle Corrida 7, Gij�n', 978901234, '10:00:00', '20:00:00', 10, 14),
('UrbanCoru�a', 'Calle Galera 15, La Coru�a', 991234567, '10:00:00', '20:00:00', 10, 15),
('UrbanGranada', 'Calle de la Gran V�a 10, Granada', 912345678, '10:00:00', '20:00:00', 10, 16),
('UrbanOviedo', 'Calle Uria 5, Oviedo', 934567890, '10:00:00', '20:00:00', 10, 17),
('UrbanCartagena', 'Calle Mayor 20, Cartagena', 956789012, '10:00:00', '20:00:00', 10, 18),
('UrbanCanarias', 'Calle Triana 8, Gran Canaria', 978901234, '10:00:00', '20:00:00', 10, 19),
('UrbanMadrid1', 'Calle del Carmen 5, Madrid', 923456789, '09:00:00', '21:00:00', 15, 1),
('UrbanMadrid2', 'Calle de Vel�zquez 10, Madrid', 945678901, '09:00:00', '21:00:00', 15, 1),
('UrbanBarcelona1', 'Avinguda Diagonal 100, Barcelona', 987654321, '09:00:00', '21:00:00', 15, 2),
('UrbanBarcelona2', 'Rambla de Catalunya 50, Barcelona', 965874123, '09:00:00', '21:00:00', 15, 2),
('UrbanAlicante1', 'Calle de Alfonso X el Sabio 15, Alicante', 963258741, '10:00:00', '20:00:00', 10, 10),
('UrbanAlicante', 'Avenida de Maisonnave 18, Alicante', 991234567, '10:00:00', '20:00:00', 10, 10);

-- INSERTS TABLA EMPLEADOS --
INSERT INTO empleado (nombre, apellidos, fechaNac, direccion, fechaCont, cargo, salario, NUSS, idTienda) VALUES
('Carlos', 'Garc�a Mart�nez', '1990-03-15', 'Calle Mayor 10, Madrid', '2015-07-01', 'Encargado', 1400.00, 'ES123456789', 1),
('Laura', 'L�pez Garc�a', '1985-05-20', 'Calle Fuencarral 25, Madrid', '2016-08-05', 'Encargado', 1400.00, 'ES234567890', 1),
('Javier', 'Mart�nez L�pez', '1992-09-10', 'Calle Gran V�a 30, Madrid', '2017-07-15', 'Encargado', 1400.00, 'ES345678901', 1),
('Mar�a', 'Gonz�lez Fern�ndez', '1988-12-03', 'Calle Serrano 40, Madrid', '2015-06-30', 'Encargado', 1400.00, 'ES456789012', 1),
('Daniel', 'Rodr�guez P�rez', '1993-11-25', 'Calle Princesa 20, Madrid', '2016-07-10', 'Encargado', 1400.00, 'ES567890123', 1),
('Sara', 'Mart�nez Rodr�guez', '1991-08-17', 'Calle Gran V�a 35, Madrid', '2015-06-25', 'Encargado', 1400.00, 'ES678901234', 1),
('Alejandro', 'Fern�ndez L�pez', '1994-02-08', 'Calle Alcal� 15, Madrid', '2017-08-20', 'Encargado', 1400.00, 'ES789012345', 1),
('Cristina', 'S�nchez G�mez', '1987-06-30', 'Calle Mayor 5, Madrid', '2015-07-05', 'Encargado', 1400.00, 'ES890123456', 1),
('Pedro', 'P�rez Mart�nez', '1990-09-12', 'Calle Atocha 12, Madrid', '2016-06-28', 'Encargado', 1400.00, 'ES901234567', 1),
('Ana', 'L�pez Rodr�guez', '1989-04-18', 'Calle Gran V�a 28, Madrid', '2018-08-10', 'Reponedor', 1250.00, 'ES012345678', 1),
('David', 'Gonz�lez Mart�nez', '1992-07-15', 'Calle Gran V�a 22, Madrid', '2016-06-25', 'Reponedor', 1250.00, 'ES987654321', 1),
('Elena', 'Mart�nez P�rez', '1988-04-30', 'Calle Mayor 12, Madrid', '2017-07-05', 'Reponedor', 1250.00, 'ES876543210', 1),
('Luc�a', 'Fern�ndez Garc�a', '1993-09-22', 'Calle Fuencarral 30, Madrid', '2015-06-30', 'Reponedor', 1250.00, 'ES765432109', 1),
('Marcos', 'G�mez Rodr�guez', '1986-11-17', 'Calle Serrano 20, Madrid', '2016-07-15', 'Reponedor', 1250.00, 'ES654321098', 1),
('Carmen', 'Mart�n S�nchez', '1990-02-28', 'Calle Princesa 15, Madrid', '2017-08-01', 'Reponedor', 1250.00, 'ES543210987', 1),
('Miguel', 'Gonz�lez L�pez', '1989-07-05', 'Calle Gran V�a 12, Madrid', '2015-06-22', 'Reponedor', 1250.00, 'ES432109876', 1),
('Paula', 'S�nchez Mart�nez', '1991-04-12', 'Calle Mayor 15, Madrid', '2016-07-08', 'Reponedor', 1250.00, 'ES321098765', 1),
('Jorge', 'Fern�ndez G�mez', '1993-08-30', 'Calle Fuencarral 35, Madrid', '2018-08-05', 'Reponedor', 1250.00, 'ES210987654', 1),
('Eva', 'Rodr�guez Mart�n', '1988-06-15', 'Calle Serrano 25, Madrid', '2017-06-28', 'Reponedor', 1250.00, 'ES109876543', 1),
('Alejandro', 'Mart�nez G�mez', '1990-09-20', 'Calle Princesa 18, Madrid', '2015-07-02', 'Reponedor', 1250.00, 'ES098765432', 1),
('Natalia', 'G�mez Rodr�guez', '1987-03-25', 'Calle Gran V�a 18, Madrid', '2016-08-10', 'Reponedor', 1250.00, 'ES987654321', 1),
('Diego', 'S�nchez P�rez', '1994-05-10', 'Calle Mayor 18, Madrid', '2018-07-05', 'Reponedor', 1250.00, 'ES876543210', 1),
('Isabel', 'L�pez Mart�nez', '1989-12-01', 'Calle Fuencarral 20, Madrid', '2018-06-30', 'Cajero', 1250.00, 'ES765432109', 1),
('Adri�n', 'Mart�n G�mez', '1991-11-18', 'Calle Serrano 15, Madrid', '2016-07-15', 'Cajero', 1250.00, 'ES654321098', 1),
('Celia', 'G�mez L�pez', '1993-10-05', 'Calle Gran V�a 10, Madrid', '2017-06-22', 'Cajero', 1250.00, 'ES543210987', 1),
('Roberto', 'Fern�ndez Mart�nez', '1988-07-12', 'Calle Mayor 20, Madrid', '2015-07-08', 'Cajero', 1250.00, 'ES432109876', 1),
('Laura', 'G�mez Mart�nez', '1992-06-18', 'Calle Fuencarral 18, Madrid', '2016-07-02', 'Cajero', 1250.00, 'ES321098765', 1),
('Javier', 'Rodr�guez S�nchez', '1990-04-25', 'Calle Serrano 10, Madrid', '2015-07-17', 'Cajero', 1250.00, 'ES210987654', 1),
('Sara', 'Gonz�lez Rodr�guez', '1993-08-30', 'Calle Mayor 30, Madrid', '2016-06-24', 'Cajero', 1250.00, 'ES109876543', 1),
('Daniel', 'Mart�nez G�mez', '1989-12-05', 'Calle Fuencarral 12, Madrid', '2018-07-10', 'Cajero', 1250.00, 'ES098765432', 1),
('Ana', 'G�mez L�pez', '1992-05-20', 'Calle Serrano 22, Madrid', '2015-06-26', 'Cajero', 1250.00, 'ES987654321', 1),
('Juan', 'Fern�ndez Mart�nez', '1991-03-15', 'Calle Mayor 25, Madrid', '2015-07-12', 'Cajero', 1250.00, 'ES876543210', 1),
('Mar�a', 'L�pez Rodr�guez', '1987-09-10', 'Calle Fuencarral 25, Madrid', '2016-06-28', 'Cajero', 1250.00, 'ES765432109', 1),
('Pablo', 'Mart�nez P�rez', '1990-07-22', 'Calle Serrano 20, Madrid', '2018-07-15', 'Cajero', 1250.00, 'ES654321098', 1),
('Elena', 'Gonz�lez S�nchez', '1988-11-28', 'Calle Mayor 18, Madrid', '2017-06-30', 'Cajero', 1250.00, 'ES543210987', 1),
('Silvia', 'Fern�ndez Garc�a', '1990-10-20', 'Carrer de Pau Claris 30, Barcelona', '2015-07-02', 'Encargado', 1400.00, 'ES765432109', 2),
('Javier', 'Gonz�lez Mart�nez', '1987-06-18', 'Carrer de Mallorca 32, Barcelona', '2015-08-05', 'Encargado', 1400.00, 'ES654321098', 2),
('Nuria', 'Mart�nez G�mez', '1993-03-22', 'Carrer de Balmes 18, Barcelona', '2015-07-15', 'Encargado', 1400.00, 'ES543210987', 2),
('Raul', 'G�mez L�pez', '1988-09-12', 'Carrer de la Rambla 22, Barcelona', '2015-06-30', 'Encargado', 1400.00, 'ES432109876', 2),
('Elena', 'Mart�nez Rodr�guez', '1991-08-30', 'Carrer de Balmes 20, Barcelona', '2015-07-10', 'Encargado', 1400.00, 'ES321098765', 2),
('Mario', 'L�pez Garc�a', '1989-12-15', 'Carrer de Mallorca 38, Barcelona', '2015-06-25', 'Encargado', 1400.00, 'ES210987654', 2),
('Clara', 'Mart�nez P�rez', '1992-05-20', 'Carrer de la Rambla 25, Barcelona', '2015-08-10', 'Encargado', 1400.00, 'ES109876543', 2),
('Diego', 'G�mez Rodr�guez', '1990-04-10', 'Carrer de Balmes 25, Barcelona', '2015-06-28', 'Encargado', 1400.00, 'ES098765432', 2),
('Sara', 'Mart�nez Mart�nez', '1987-07-05', 'Carrer de Mallorca 35, Barcelona', '2015-07-12', 'Encargado', 1400.00, 'ES987654321', 2),
('Javier', 'Fern�ndez P�rez', '1994-09-10', 'Carrer de Balmes 28, Barcelona', '2015-06-28', 'Reponedor', 1250.00, 'ES876543210', 2),
('Natalia', 'G�mez Rodr�guez', '1991-02-18', 'Carrer de la Rambla 30, Barcelona', '2015-07-15', 'Reponedor', 1250.00, 'ES765432109', 2),
('Miguel', 'Mart�nez Garc�a', '1988-11-23', 'Carrer de Mallorca 40, Barcelona', '2015-06-30', 'Reponedor', 1250.00, 'ES654321098', 2),
('Eva', 'L�pez Mart�nez', '1993-06-20', 'Carrer de Balmes 32, Barcelona', '2015-07-02', 'Reponedor', 1250.00, 'ES543210987', 2),
('Carlos', 'Garc�a P�rez', '1989-04-15', 'Carrer de la Rambla 35, Barcelona', '2015-08-05', 'Reponedor', 1250.00, 'ES432109876', 2),
('Laura', 'Mart�nez Rodr�guez', '1992-11-22', 'Carrer de Mallorca 45, Barcelona', '2015-07-15', 'Reponedor', 1250.00, 'ES321098765', 2),
('Pedro', 'G�mez L�pez', '1988-07-12', 'Carrer de Balmes 40, Barcelona', '2015-06-30', 'Reponedor', 1250.00, 'ES210987654', 2),
('Sandra', 'Mart�nez P�rez', '1991-12-05', 'Carrer de la Rambla 38, Barcelona', '2015-07-10', 'Reponedor', 1250.00, 'ES109876543', 2),
('Adri�n', 'Fern�ndez Garc�a', '1990-09-17', 'Carrer de Mallorca 48, Barcelona', '2015-06-25', 'Reponedor', 1250.00, 'ES098765432', 2),
('Marina', 'Mart�nez Mart�nez', '1993-05-28', 'Carrer de Balmes 45, Barcelona', '2015-08-10', 'Reponedor', 1250.00, 'ES987654321', 2),
('Diego', 'G�mez Rodr�guez', '1987-08-10', 'Carrer de la Rambla 40, Barcelona', '2015-06-28', 'Reponedor', 1250.00, 'ES876543210', 2),
('Natalia', 'Mart�nez Garc�a', '1990-02-18', 'Carrer de Mallorca 50, Barcelona', '2015-07-15', 'Reponedor', 1250.00, 'ES765432109', 2),
('Luc�a', 'Gonz�lez Mart�nez', '1993-09-20', 'Carrer de Balmes 55, Barcelona', '2015-07-02', 'Reponedor', 1250.00, 'ES654321098', 2),
('Hugo', 'Mart�nez G�mez', '1988-11-15', 'Carrer de la Rambla 45, Barcelona', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 2),
('Clara', 'G�mez L�pez', '1991-03-22', 'Carrer de Mallorca 55, Barcelona', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 2),
('Pablo', 'Mart�nez Rodr�guez', '1987-05-10', 'Carrer de Balmes 50, Barcelona', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 2),
('Marina', 'G�mez P�rez', '1992-08-30', 'Carrer de la Rambla 50, Barcelona', '2015-07-10', 'Cajero', 1250.00, 'ES210987654', 2),
('Sergio', 'Mart�nez L�pez', '1989-07-12', 'Carrer de Mallorca 60, Barcelona', '2015-06-25', 'Cajero', 1250.00, 'ES109876543', 2),
('Laura', 'Garc�a P�rez', '1994-04-05', 'Carrer de Balmes 60, Barcelona', '2015-08-10', 'Cajero', 1250.00, 'ES098765432', 2),
('Juan', 'Mart�nez Mart�nez', '1990-01-17', 'Carrer de la Rambla 55, Barcelona', '2015-06-28', 'Cajero', 1250.00, 'ES987654321', 2),
('Andrea', 'G�mez Garc�a', '1988-06-10', 'Carrer de Mallorca 65, Barcelona', '2015-07-15', 'Cajero', 1250.00, 'ES876543210', 2),
('Diego', 'Mart�nez P�rez', '1993-04-28', 'Carrer de Balmes 65, Barcelona', '2015-06-28', 'Cajero', 1250.00, 'ES765432109', 2),
('Luc�a', 'Garc�a Rodr�guez', '1987-12-10', 'Carrer de la Rambla 60, Barcelona', '2015-07-15', 'Cajero', 1250.00, 'ES654321098', 2),
('H�ctor', 'Mart�nez G�mez', '1992-10-18', 'Carrer de Mallorca 70, Barcelona', '2015-06-30', 'Cajero', 1250.00, 'ES543210987', 2),
('Elena', 'Garc�a Mart�nez', '1989-03-28', 'Carrer de Balmes 70, Barcelona', '2015-08-10', 'Cajero', 1250.00, 'ES432109876', 2),
('Laura', 'Garc�a L�pez', '1993-09-20', 'Calle de la Paz 10, Valencia', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 3),
('Daniel', 'Mart�nez S�nchez', '1988-11-15', 'Calle de San Vicente 15, Valencia', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 3),
('Sof�a', 'Garc�a Fern�ndez', '1991-03-22', 'Calle de X�tiva 20, Valencia', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 3),
('Mario', 'Mart�nez P�rez', '1987-05-10', 'Calle de Ribera 25, Valencia', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 3),
('Elena', 'Garc�a Mart�nez', '1992-08-30', 'Calle de las Barcas 30, Valencia', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 3),
('Pablo', 'Mart�nez L�pez', '1989-07-12', 'Calle de la Reina 35, Valencia', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 3),
('Luc�a', 'Garc�a P�rez', '1993-05-28', 'Calle de la Paz II 40, Valencia', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 3),
('Carlos', 'Mart�nez Mart�nez', '1987-12-05', 'Calle de Col�n 45, Valencia', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 3),
('Sara', 'Garc�a S�nchez', '1990-01-17', 'Calle de las Serranos 50, Valencia', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 3),
('Juan', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle de la Sangre 55, Valencia', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 3),
('Mar�a', 'Garc�a L�pez', '1993-09-20', 'Calle Sierpes 10, Sevilla', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 4),
('David', 'Mart�nez S�nchez', '1988-11-15', 'Calle Tetu�n 15, Sevilla', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 4),
('Ana', 'Garc�a Fern�ndez', '1991-03-22', 'Avenida de la Constituci�n 20, Sevilla', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 4),
('Pablo', 'Mart�nez P�rez', '1987-05-10', 'Calle Regina 25, Sevilla', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 4),
('Luc�a', 'Garc�a Mart�nez', '1992-08-30', 'Calle Sierpes II 30, Sevilla', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 4),
('Javier', 'Mart�nez L�pez', '1989-07-12', 'Calle Feria 35, Sevilla', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 4),
('Sara', 'Garc�a P�rez', '1993-05-28', 'Calle Mateos Gago 40, Sevilla', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 4),
('Carlos', 'Mart�nez Mart�nez', '1987-12-05', 'Calle Francos 45, Sevilla', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 4),
('Elena', 'Garc�a S�nchez', '1990-01-17', 'Calle Sierpes III 50, Sevilla', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 4),
('Juan', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle Almirante Apodaca 55, Sevilla', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 4),
('Mar�a', 'Garc�a L�pez', '1993-09-20', 'Calle Alfonso 10, Zaragoza', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 5),
('David', 'Mart�nez S�nchez', '1988-11-15', 'Calle Don Jaime 15, Zaragoza', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 5),
('Ana', 'Garc�a Fern�ndez', '1991-03-22', 'Calle Alfonso I 20, Zaragoza', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 5),
('Pablo', 'Mart�nez P�rez', '1987-05-10', 'Calle Delicias 25, Zaragoza', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 5),
('Luc�a', 'Garc�a Mart�nez', '1992-08-30', 'Paseo Independencia 30, Zaragoza', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 5),
('Javier', 'Mart�nez L�pez', '1989-07-12', 'Calle Don Jaime I 35, Zaragoza', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 5),
('Sara', 'Garc�a P�rez', '1993-05-28', 'Paseo de la Independencia 40, Zaragoza', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 5),
('Carlos', 'Mart�nez Mart�nez', '1987-12-05', 'Calle Alfonso 45, Zaragoza', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 5),
('Elena', 'Garc�a S�nchez', '1990-01-17', 'Calle Alfonso II 50, Zaragoza', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 5),
('Juan', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle Coso 55, Zaragoza', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 5),
('Mar�a', 'Garc�a L�pez', '1993-09-20', 'Calle Larios 10, M�laga', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 6),
('David', 'Mart�nez S�nchez', '1988-11-15', 'Calle Compa��a 15, M�laga', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 6),
('Ana', 'Garc�a Fern�ndez', '1991-03-22', 'Calle Granada 20, M�laga', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 6),
('Pablo', 'Mart�nez P�rez', '1987-05-10', 'Calle Carreter�a 25, M�laga', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 6),
('Luc�a', 'Garc�a Mart�nez', '1992-08-30', 'Calle Marqu�s de Larios 30, M�laga', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 6),
('Javier', 'Mart�nez L�pez', '1989-07-12', 'Calle Nueva 35, M�laga', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 6),
('Sara', 'Garc�a P�rez', '1993-05-28', 'Calle San Agust�n 40, M�laga', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 6),
('Carlos', 'Mart�nez Mart�nez', '1987-12-05', 'Calle Granada 45, M�laga', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 6),
('Elena', 'Garc�a S�nchez', '1990-01-17', 'Calle Larios 50, M�laga', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 6),
('Juan', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle Nueva 55, M�laga', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 6),
('Mar�a', 'Garc�a L�pez', '1993-09-20', 'Calle de la Paz 10, Murcia', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 7),
('David', 'Mart�nez S�nchez', '1988-11-15', 'Calle del Carmen 15, Murcia', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 7),
('Ana', 'Garc�a Fern�ndez', '1991-03-22', 'Calle Mayor 20, Murcia', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 7),
('Pablo', 'Mart�nez P�rez', '1987-05-10', 'Calle Traper�a 25, Murcia', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 7),
('Luc�a', 'Garc�a Mart�nez', '1992-08-30', 'Calle Plater�a 30, Murcia', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 7),
('Javier', 'Mart�nez L�pez', '1989-07-12', 'Calle Jaboner�as 35, Murcia', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 7),
('Sara', 'Garc�a P�rez', '1993-05-28', 'Calle de los Ap�stoles 40, Murcia', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 7),
('Carlos', 'Mart�nez Mart�nez', '1987-12-05', 'Calle Riquelme 45, Murcia', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 7),
('Elena', 'Garc�a S�nchez', '1990-01-17', 'Calle Plateria 50, Murcia', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 7),
('Juan', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle Jara Carrillo 55, Murcia', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 7),
('Marina', 'Mart�nez L�pez', '1993-09-20', 'Carrer de Jaume Balmes 10, Palma', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 8),
('Diego', 'Garc�a Mart�nez', '1988-11-15', 'Carrer de Guillem Massot 15, Palma', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 8),
('Luna', 'Mart�nez Garc�a', '1991-03-22', 'Carrer de Josep Villalonga 20, Palma', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 8),
('Hugo', 'Garc�a Mart�nez', '1987-05-10', 'Carrer de Francisco Martorell Oliver 25, Palma', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 8),
('Aitana', 'Garc�a Mart�nez', '1992-08-30', 'Carrer de Joan Crespi 30, Palma', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 8),
('Sergio', 'Mart�nez Garc�a', '1989-07-12', 'Carrer de Francesc Fiol i Joan 35, Palma', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 8),
('Luc�a', 'Garc�a Mart�nez', '1993-05-28', 'Carrer de Jeroni Alomar 40, Palma', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 8),
('Mateo', 'Mart�nez Garc�a', '1987-12-05', 'Carrer de Ramon Berenguer III 45, Palma', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 8),
('Elena', 'Garc�a Mart�nez', '1990-01-17', 'Carrer de Jaume II 50, Palma', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 8),
('Santiago', 'Mart�nez Garc�a', '1992-10-18', 'Carrer del Sindicat 55, Palma', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 8),
('Ainhoa', 'Garc�a L�pez', '1993-09-20', 'Calle de Ercilla 10, Bilbao', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 9),
('Iker', 'Mart�nez S�nchez', '1988-11-15', 'Calle de Gran V�a 15, Bilbao', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 9),
('Leire', 'Garc�a Fern�ndez', '1991-03-22', 'Calle de Autonom�a 20, Bilbao', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 9),
('Asier', 'Mart�nez P�rez', '1987-05-10', 'Calle de Alameda de Urquijo 25, Bilbao', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 9),
('Maite', 'Garc�a Mart�nez', '1992-08-30', 'Calle de San Francisco 30, Bilbao', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 9),
('Jon', 'Mart�nez L�pez', '1989-07-12', 'Calle de Rodr�guez Arias 35, Bilbao', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 9),
('Izaro', 'Garc�a P�rez', '1993-05-28', 'Calle de Sabino Arana 40, Bilbao', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 9),
('Unai', 'Mart�nez Mart�nez', '1987-12-05', 'Calle de Licenciado Poza 45, Bilbao', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 9),
('Irati', 'Garc�a S�nchez', '1990-01-17', 'Calle de Hurtado de Am�zaga 50, Bilbao', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 9),
('Gorka', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle de Euskalduna 55, Bilbao', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 9),
('Mar�a', 'Garc�a L�pez', '1993-09-20', 'Calle de la Concha 10, C�rdoba', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 11),
('Javier', 'Mart�nez S�nchez', '1988-11-15', 'Calle del Conde de Torres Cabrera 15, C�rdoba', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 11),
('Sara', 'Garc�a Fern�ndez', '1991-03-22', 'Calle del Duque de Hornachuelos 20, C�rdoba', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 11),
('Antonio', 'Mart�nez P�rez', '1987-05-10', 'Calle de la Fuenseca 25, C�rdoba', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 11),
('Luc�a', 'Garc�a Mart�nez', '1992-08-30', 'Calle de Mar�a Auxiliadora 30, C�rdoba', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 11),
('David', 'Mart�nez L�pez', '1989-07-12', 'Calle de la Cruz Conde 35, C�rdoba', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 11),
('Elena', 'Garc�a P�rez', '1993-05-28', 'Calle del Conde de Gondomar 40, C�rdoba', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 11),
('Alejandro', 'Mart�nez Mart�nez', '1987-12-05', 'Calle de la Cruz del Rastro 45, C�rdoba', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 11),
('Laura', 'Garc�a S�nchez', '1990-01-17', 'Calle de San Pablo 50, C�rdoba', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 11),
('Manuel', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle del Arzobispo Castro 55, C�rdoba', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 11),
('Mar�a', 'Garc�a L�pez', '1993-09-20', 'Calle de la Concha 10, C�rdoba', '2015-07-02', 'Cajero', 1250.00, 'ES654321098', 11),
('Javier', 'Mart�nez S�nchez', '1988-11-15', 'Calle del Conde de Torres Cabrera 15, C�rdoba', '2015-08-05', 'Cajero', 1250.00, 'ES543210987', 11),
('Sara', 'Garc�a Fern�ndez', '1991-03-22', 'Calle del Duque de Hornachuelos 20, C�rdoba', '2015-07-15', 'Cajero', 1250.00, 'ES432109876', 11),
('Antonio', 'Mart�nez P�rez', '1987-05-10', 'Calle de la Fuenseca 25, C�rdoba', '2015-06-30', 'Cajero', 1250.00, 'ES321098765', 11),
('Luc�a', 'Garc�a Mart�nez', '1992-08-30', 'Calle de Mar�a Auxiliadora 30, C�rdoba', '2015-07-10', 'Reponedor', 1250.00, 'ES210987654', 11),
('David', 'Mart�nez L�pez', '1989-07-12', 'Calle de la Cruz Conde 35, C�rdoba', '2015-06-25', 'Reponedor', 1250.00, 'ES109876543', 11),
('Elena', 'Garc�a P�rez', '1993-05-28', 'Calle del Conde de Gondomar 40, C�rdoba', '2015-08-10', 'Reponedor', 1250.00, 'ES098765432', 11),
('Alejandro', 'Mart�nez Mart�nez', '1987-12-05', 'Calle de la Cruz del Rastro 45, C�rdoba', '2015-07-15', 'Reponedor', 1250.00, 'ES987654321', 11),
('Laura', 'Garc�a S�nchez', '1990-01-17', 'Calle de San Pablo 50, C�rdoba', '2015-06-28', 'Encargado', 1400.00, 'ES876543210', 11),
('Manuel', 'Mart�nez Rodr�guez', '1992-10-18', 'Calle del Arzobispo Castro 55, C�rdoba', '2015-06-30', 'Encargado', 1400.00, 'ES765432109', 11),
('Juan', 'Gonz�lez P�rez', '1990-03-12', 'Calle de las Angustias 15, Valladolid', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 12),
('Mar�a', 'Mart�nez Rodr�guez', '1988-08-25', 'Calle de las Plater�as 20, Valladolid', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 12),
('Pedro', 'L�pez Garc�a', '1993-04-30', 'Calle de la Universidad 25, Valladolid', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 12),
('Ana', 'Fern�ndez L�pez', '1989-11-15', 'Calle de la Plater�a Vieja 30, Valladolid', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 12),
('Carlos', 'Mart�n P�rez', '1991-06-20', 'Calle de la Acera de Recoletos 35, Valladolid', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 12),
('Laura', 'Garc�a Mart�nez', '1990-09-05', 'Calle de las Angustias 40, Valladolid', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 12),
('David', 'S�nchez Rodr�guez', '1992-07-10', 'Calle de la Universidad 45, Valladolid', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 12),
('Marta', 'P�rez Garc�a', '1987-05-28', 'Calle de las Plater�as 50, Valladolid', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 12),
('Javier', 'Fern�ndez Mart�n', '1993-02-15', 'Calle de la Universidad 55, Valladolid', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 12),
('Sara', 'Mart�nez S�nchez', '1988-10-20', 'Calle de las Plater�as 60, Valladolid', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 12),
('Antonio', 'Garc�a P�rez', '1992-03-18', 'Calle de Pizarro 12, Vigo', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 13),
('Mar�a', 'Rodr�guez Mart�nez', '1989-08-22', 'Calle de L�pez Mora 20, Vigo', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 13),
('Pedro', 'Fern�ndez G�mez', '1994-04-25', 'Avenida de Madrid 15, Vigo', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 13),
('Ana', 'L�pez Rodr�guez', '1990-11-10', 'Calle de la Paz 30, Vigo', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 13),
('Carlos', 'Mart�nez Garc�a', '1991-06-15', 'Avenida de Europa 25, Vigo', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 13),
('Laura', 'G�mez Rodr�guez', '1993-09-30', 'Calle de Urz�iz 40, Vigo', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 13),
('David', 'Rodr�guez Mart�n', '1992-07-05', 'Calle de Col�n 45, Vigo', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 13),
('Marta', 'Garc�a P�rez', '1988-05-20', 'Calle de Pizarro 50, Vigo', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 13),
('Javier', 'Fern�ndez L�pez', '1993-02-10', 'Avenida de Europa 55, Vigo', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 13),
('Sara', 'Mart�nez G�mez', '1987-10-25', 'Calle de L�pez Mora 60, Vigo', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 13),
('Pablo', 'Garc�a Mart�nez', '1990-03-18', 'Calle de Mariano Pola 12, Gij�n', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 14),
('Elena', 'Mart�nez Rodr�guez', '1988-08-22', 'Calle de Manuel Pedregal 20, Gij�n', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 14),
('Diego', 'Fern�ndez G�mez', '1993-04-25', 'Avenida de la Costa 15, Gij�n', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 14),
('Laura', 'Rodr�guez P�rez', '1992-11-10', 'Calle de Covadonga 30, Gij�n', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 14),
('Marcos', 'Mart�nez Garc�a', '1991-06-15', 'Avenida de los Campones 25, Gij�n', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 14),
('Carmen', 'G�mez Rodr�guez', '1993-09-30', 'Calle de Manuel Pedregal 40, Gij�n', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 14),
('Javier', 'Rodr�guez Mart�n', '1992-07-05', 'Calle de Manuel Pedregal 45, Gij�n', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 14),
('Sara', 'Garc�a P�rez', '1988-05-20', 'Calle de Manuel Pedregal 50, Gij�n', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 14),
('David', 'Fern�ndez L�pez', '1993-02-10', 'Calle de Manuel Pedregal 55, Gij�n', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 14),
('Eva', 'Mart�nez G�mez', '1987-10-25', 'Calle de Manuel Pedregal 60, Gij�n', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 14),
('Carlos', 'Gonz�lez L�pez', '1992-04-15', 'Calle de la Torre 12, La Coru�a', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 15),
('Mar�a', 'Mart�nez Garc�a', '1989-08-18', 'Calle de la Ronda 20, La Coru�a', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 15),
('Juan', 'Rodr�guez P�rez', '1993-05-25', 'Calle del Parrote 15, La Coru�a', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 15),
('Laura', 'Fern�ndez G�mez', '1990-11-10', 'Calle de la Torre 30, La Coru�a', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 15),
('Sergio', 'Garc�a Mart�nez', '1991-06-15', 'Calle de la Ronda 25, La Coru�a', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 15),
('Ana', 'Mart�nez Rodr�guez', '1993-09-30', 'Calle de la Torre 40, La Coru�a', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 15),
('Pedro', 'Rodr�guez Mart�n', '1992-07-05', 'Calle del Parrote 45, La Coru�a', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 15),
('Eva', 'Garc�a P�rez', '1988-05-20', 'Calle de la Ronda 50, La Coru�a', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 15),
('Miguel', 'Mart�nez L�pez', '1993-02-10', 'Calle de la Torre 55, La Coru�a', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 15),
('Laura', 'Fern�ndez G�mez', '1987-10-25', 'Calle de la Ronda 60, La Coru�a', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 15),
('Sara', 'Garc�a Mart�nez', '1990-03-15', 'Calle de la Gran V�a 10, Granada', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 16),
('Daniel', 'Mart�nez L�pez', '1991-08-18', 'Calle de los Reyes Cat�licos 20, Granada', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 16),
('Luc�a', 'Gonz�lez P�rez', '1993-05-25', 'Calle de la Fuente 15, Granada', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 16),
('Carlos', 'Garc�a G�mez', '1990-11-10', 'Calle de la Plaza 30, Granada', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 16),
('Laura', 'Mart�nez Mart�n', '1991-06-15', 'Calle de la Alhambra 25, Granada', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 16),
('Manuel', 'Gonz�lez Rodr�guez', '1993-09-30', 'Calle de la Catedral 40, Granada', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 16),
('Mar�a', 'Garc�a Mart�nez', '1992-07-05', 'Calle del Albaic�n 45, Granada', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 16),
('Pablo', 'Mart�nez P�rez', '1988-05-20', 'Calle de la Alpujarra 50, Granada', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 16),
('Ana', 'Garc�a L�pez', '1993-02-10', 'Calle de la Sierra Nevada 55, Granada', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 16),
('Javier', 'Mart�nez P�rez', '1987-10-25', 'Calle de la Vega 60, Granada', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 16),
('Marcos', 'Gonz�lez Mart�nez', '1990-04-15', 'Calle Uria 10, Oviedo', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 17),
('Carmen', 'Fern�ndez Garc�a', '1991-09-18', 'Calle Jovellanos 20, Oviedo', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 17),
('Daniel', 'L�pez Rodr�guez', '1993-06-25', 'Calle San Francisco 15, Oviedo', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 17),
('Ana', 'Mart�nez Fern�ndez', '1990-12-10', 'Calle Santa Susana 30, Oviedo', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 17),
('Sergio', 'Garc�a P�rez', '1991-07-15', 'Calle San Francisco 25, Oviedo', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 17),
('Laura', 'Mart�nez Rodr�guez', '1993-10-30', 'Calle Arg�elles 40, Oviedo', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 17),
('Juan', 'Gonz�lez L�pez', '1992-08-05', 'Calle Santa Susana 45, Oviedo', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 17),
('Luc�a', 'Mart�nez Mart�nez', '1988-06-20', 'Calle Uria 50, Oviedo', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 17),
('Pedro', 'Garc�a Rodr�guez', '1993-03-10', 'Calle Jovellanos 55, Oviedo', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 17),
('Elena', 'Mart�nez Garc�a', '1987-11-25', 'Calle Arg�elles 60, Oviedo', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 17),
('Antonio', 'S�nchez Mart�nez', '1992-04-15', 'Calle Mayor 10, Cartagena', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 18),
('Mar�a', 'Garc�a Fern�ndez', '1991-09-18', 'Calle del Carmen 20, Cartagena', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 18),
('Jos�', 'Mart�nez Rodr�guez', '1993-06-25', 'Avenida Juan Carlos I 15, Cartagena', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 18),
('Ana', 'Fern�ndez P�rez', '1990-12-10', 'Calle del Parque 30, Cartagena', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 18),
('David', 'Gonz�lez S�nchez', '1991-07-15', 'Calle Real 25, Cartagena', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 18),
('Laura', 'Rodr�guez Mart�nez', '1993-10-30', 'Plaza Espa�a 40, Cartagena', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 18),
('Manuel', 'P�rez G�mez', '1992-08-05', 'Calle Santa Florentina 45, Cartagena', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 18),
('Cristina', 'Mart�n L�pez', '1988-06-20', 'Calle Gisbert 50, Cartagena', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 18),
('Francisco', 'G�mez Rodr�guez', '1993-03-10', 'Calle de los Artilleros 55, Cartagena', '2015-06-23', 'Encargado', 1400.00, 'ES901234567', 18),
('Isabel', 'L�pez Mart�nez', '1987-11-25', 'Avenida del Cant�n 60, Cartagena', '2015-06-26', 'Encargado', 1400.00, 'ES012345678', 18),
('Pablo', 'S�nchez G�mez', '1990-05-12', 'Calle Mayor 10, Alicante', '2015-06-21', 'Cajero', 1250.00, 'ES123456789', 19),
('Marina', 'Garc�a Mart�nez', '1992-09-15', 'Calle del Carmen 20, Alicante', '2015-06-25', 'Cajero', 1250.00, 'ES234567890', 19),
('Javier', 'Mart�nez L�pez', '1993-06-20', 'Avenida Juan Carlos I 15, Alicante', '2015-06-28', 'Cajero', 1250.00, 'ES345678901', 19),
('Laura', 'Fern�ndez P�rez', '1991-12-10', 'Calle del Parque 30, Alicante', '2015-07-01', 'Cajero', 1250.00, 'ES456789012', 19),
('Daniel', 'Gonz�lez S�nchez', '1991-07-15', 'Calle Real 25, Alicante', '2015-06-24', 'Cajero', 1250.00, 'ES567890123', 19),
('Natalia', 'Rodr�guez Mart�nez', '1993-10-30', 'Plaza Espa�a 40, Alicante', '2015-06-29', 'Cajero', 1250.00, 'ES678901234', 19),
('Alejandro', 'P�rez G�mez', '1992-08-05', 'Calle Santa Florentina 45, Alicante', '2015-06-22', 'Cajero', 1250.00, 'ES789012345', 19),
('Sara', 'Mart�n L�pez', '1988-06-20', 'Calle Gisbert 50, Alicante', '2015-07-05', 'Cajero', 1250.00, 'ES890123456', 19),
('Iv�n', 'G�mez Rodr�guez', '1993-03-10', 'Calle de los Artilleros 55, Alicante', '2015-06-23', 'Cajero', 1250.00, 'ES901234567', 19),
('Carlos', 'S�nchez Mart�nez', '1990-05-12', 'Calle Mayor 15, Alicante', '2015-06-21', 'Reponedor', 1250.00, 'ES123456789', 19),
('Paula', 'Garc�a Mart�nez', '1992-09-15', 'Calle del Carmen 25, Alicante', '2015-06-25', 'Reponedor', 1250.00, 'ES234567890', 19),
('Pedro', 'Mart�nez L�pez', '1993-06-20', 'Avenida Juan Carlos I 20, Alicante', '2015-06-28', 'Reponedor', 1250.00, 'ES345678901', 19),
('Elena', 'Fern�ndez P�rez', '1991-12-10', 'Calle del Parque 35, Alicante', '2015-07-01', 'Reponedor', 1250.00, 'ES456789012', 19),
('Juan', 'Gonz�lez S�nchez', '1991-07-15', 'Calle Real 30, Alicante', '2015-06-24', 'Reponedor', 1250.00, 'ES567890123', 19),
('Mar�a', 'Rodr�guez Mart�nez', '1993-10-30', 'Plaza Espa�a 45, Alicante', '2015-06-29', 'Reponedor', 1250.00, 'ES678901234', 19),
('Jorge', 'P�rez G�mez', '1992-08-05', 'Calle Santa Florentina 50, Alicante', '2015-06-22', 'Reponedor', 1250.00, 'ES789012345', 19),
('Ana', 'Mart�n L�pez', '1988-06-20', 'Calle Gisbert 55, Alicante', '2015-07-05', 'Reponedor', 1250.00, 'ES890123456', 19),
('Mario', 'G�mez Rodr�guez', '1993-03-10', 'Calle de los Artilleros 60, Alicante', '2015-06-23', 'Reponedor', 1250.00, 'ES901234567', 19),
('Carlos', 'Hern�ndez P�rez', '1985-05-15', 'Calle Mayor 20, Alicante', '2015-06-20', 'Encargado', 1400.00, 'ES123456789', 10),
('Laura', 'Garc�a Mart�nez', '1986-09-28', 'Avenida del Puerto 25, Alicante', '2015-06-19', 'Encargado', 1400.00, 'ES234567890', 10);

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