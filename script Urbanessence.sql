CREATE DATABASE Urbanessence;
GO

USE Urbanessence;
GO

CREATE TABLE cliente(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(80) NOT NULL,
	genero BIT NOT NULL,
	direccion NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(9) NOT NULL,
	fechaNac DATE,

	CONSTRAINT pk_cliente PRIMARY KEY(id)
);

CREATE TABLE tipo(
	id INT IDENTITY(1,1) NOT NULL,
	nombre NVARCHAR(20) NOT NULL,

	CONSTRAINT pk_tipo PRIMARY KEY(id)
);

CREATE TABLE ciudad(
	id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	provincia VARCHAR(50) NOT NULL,
	numHabitantes INT NOT NULL,

	CONSTRAINT PK_Ciudad PRIMARY KEY(id)
);

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

create table pedido(
	id INT IDENTITY(1,1) NOT NULL,
	fecha DATE NOT NULL,
	totalPedido DECIMAL(8,2) NOT NULL,
	estado bit NOT NULL,
	idCliente INT NOT NULL,
	idEmpleado INT NOT NULL,

	CONSTRAINT pk_pedido PRIMARY KEY (id),
	CONSTRAINT fk_cliente_pedido FOREIGN KEY (idCliente) REFERENCES cliente(id),
	CONSTRAINT fk_empleado_pedido FOREIGN KEY (idEmpleado) REFERENCES empleado(id)
);

create table pedidoProducto(
	id INT identity(1,1) NOT NULL,
	cantidad INT NOT NULL,
	idPedido INT NOT NULL,
	idProducto INT NOT NULL,

	CONSTRAINT pk_pedidoProducto PRIMARY KEY(id),
	CONSTRAINT fk_pedido_pedidoProducto FOREIGN KEY(idPedido) REFERENCES pedido(id),
	CONSTRAINT fk_producto_pedidoProducto FOREIGN KEY(idProducto) REFERENCES producto(id)
);

CREATE TABLE productoTienda(
	productoID INT NOT NULL,
	tiendaID INT NOT NULL,
	cantidad INT NOT NULL,

	CONSTRAINT PK_productoTienda PRIMARY KEY(productoID, tiendaID),
	CONSTRAINT FK_ProductoPT FOREIGN KEY(productoID) REFERENCES producto(id),
	CONSTRAINT FK_TiendaPT FOREIGN KEY(tiendaID) REFERENCES tienda(id)
)



INSERT INTO cliente(nombre, genero, direccion, telefono, fechaNac) VALUES
('Carmen Ruiz Ortega', 0, 'Calle San Vicente 23, Valencia', '611334455', '1988-09-30'),
('Antonio Lopez Gonzalez', 1, 'Avenida de la Constituci�n 14, Sevilla', '622556677', '1979-02-18'),
('Laura Fernandez Martin', 0, 'Calle Mayor 6, Zaragoza', '633778899', '1986-12-12'),
('Josefa Morales Alvarez', 0, 'Calle Serrano 19, Madrid', '644112233', '1995-11-11'),
('Miguel Rodriguez Jimenez', 1, 'Avenida de Am�rica 2, Madrid', '655445566', '1983-07-21'),
('Lucia Garcia Castillo', 0, 'Paseo de la Castellana 10, Madrid', '611556677', '1990-04-14'),
('Francisco Sanchez Gil', 1, 'Calle de Alcal� 100, Madrid', '622778899', '1981-03-03'),
('Pilar Vargas Ruiz', 0, 'Calle Gran Capit�n 3, Granada', '633112233', '1993-09-19'),
('Alberto Martin Diaz', 1, 'Avenida de los Pinos 17, Murcia', '644334455', '1987-08-05'),
('Sofia Lopez Torres', 0, 'Plaza del Pilar 1, Zaragoza', '655667788', '1994-01-01'),
('Enrique Gomez Martinez', 1, 'Calle Vel�zquez 5, Madrid', '611778899', '1985-05-05'),
('Raquel Diaz Romero', 0, 'Calle Lara�a 12, Sevilla', '622112233', '1991-06-06'),
('Rafael Ortega Hernandez', 1, 'Avenida Blasco Ib��ez 15, Valencia', '633445566', '1982-07-07'),
('Isabel Gil Perez', 0, 'Calle Larios 15, M�laga', '644556677', '1996-02-22'),
('Javier Herrera Ramos', 1, 'Avenida del Cid 32, Valencia', '655778899', '1989-10-10'),
('Natalia Gonzalez Suarez', 0, 'Calle de la Princesa 4, Madrid', '611889900', '1993-11-11'),
('Adrian Alvarez Castro', 1, 'Avenida de Galicia 9, Oviedo', '622334455', '1986-12-12'),
('Marta Castillo Navarro', 0, 'Calle Ur�a 25, Oviedo', '633556677', '1991-09-09'),
('Sergio Morales Vega', 1, 'Calle Recogidas 22, Granada', '644112233', '1984-08-18'),
('Teresa Marquez Jimenez', 0, 'Calle Toledo 8, Madrid', '655334455', '1995-03-03'),
('Andres Soto Ramirez', 1, 'Calle Alfonso XII 13, Sevilla', '611223344', '1980-04-14'),
('Elena Rubio Sanchez', 0, 'Paseo de San Francisco 11, Bilbao', '622556677', '1992-05-15'),
('Vicente Iglesias Garcia', 1, 'Calle Cuchilleros 2, Salamanca', '633778899', '1975-06-16'),
('Paula Molina Gonzalez', 0, 'Calle Feria 6, Sevilla', '644112233', '1985-07-17'),
('Rodrigo Ruiz Fernandez', 1, 'Calle Tetu�n 5, Sevilla', '655223344', '1990-08-18'),
('Monica Fernandez Ruiz', 0, 'Calle Sierpes 9, Sevilla', '611445566', '1988-09-19'),
('Fernando Delgado Morales', 1, 'Calle Larios 7, M�laga', '622667788', '1979-10-20'),
('Patricia Dominguez Martin', 0, 'Calle Granada 10, M�laga', '633889900', '1986-11-21'),
('Gabriel Vargas Torres', 1, 'Calle Marqu�s de Larios 14, M�laga', '644334455', '1992-12-22'),
('Rocio Blanco Jimenez', 0, 'Calle Real 16, C�diz', '655445566', '1983-01-23'),
('David Suarez Garcia', 1, 'Calle Ancha 18, C�diz', '611556677', '1990-02-24'),
('Sandra Martinez Lopez', 0, 'Calle Mayor 20, Murcia', '622778899', '1984-03-25'),
('Alvaro Hernandez Ramos', 1, 'Calle San Miguel 22, Palma de Mallorca', '633112233', '1991-04-26'),
('Cristina Perez Gil', 0, 'Avenida Gabriel Roca 30, Palma de Mallorca', '644556677', '1989-05-27'),
('Daniel Lopez Sanchez', 1, 'Calle Jaime III 34, Palma de Mallorca', '655889900', '1987-06-28'),
('Natalia Hernandez Garcia', 0, 'Calle del Mar 3, Alicante', '611112233', '1992-07-29'),
('Manuel Gil Perez', 1, 'Calle San Vicente 5, Valencia', '622334455', '1981-08-30'),
('Isabel Jimenez Ruiz', 0, 'Calle Serrano 7, Madrid', '633556677', '1985-09-01'),
('Jose Torres Hernandez', 1, 'Calle Preciados 12, Madrid', '644778899', '1994-10-02'),
('Silvia Ruiz Gonzalez', 0, 'Paseo de la Castellana 50, Madrid', '655112233', '1987-11-03'),
('Mario Martinez Vazquez', 1, 'Calle Gran V�a 22, Madrid', '611334455', '1983-12-04'),
('Elena Romero Sanchez', 0, 'Calle de Alcal� 15, Madrid', '622556677', '1990-01-05'),
('Julio Ortiz Fernandez', 1, 'Calle Mayor 8, Zaragoza', '633778899', '1988-02-06'),
('Alicia Gutierrez Lopez', 0, 'Calle Alfonso I 9, Zaragoza', '644112233', '1993-03-07'),
('Pedro Fernandez Gomez', 1, 'Calle Mayor 3, Madrid', '611223344', '1984-09-15'),
('Marina Sanchez Torres', 0, 'Avenida de Am�rica 10, Barcelona', '622445566', '1993-07-23'),
('Ismael Ruiz Fernandez', 1, 'Calle Gran V�a 15, Madrid', '633667788', '1980-04-01'),
('Sara Mart�nez Garc�a', 0, 'Paseo de la Castellana 20, Madrid', '644889900', '1990-12-07'),
('Jorge L�pez Mart�nez', 1, 'Calle Alcal� 50, Madrid', '655112233', '1986-05-11'),
('Celia Gonz�lez L�pez', 0, 'Calle Goya 7, Madrid', '611334455', '1987-08-30'),
('Marcos P�rez Rodr�guez', 1, 'Calle Serrano 25, Madrid', '622556677', '1995-03-05'),
('Luc�a Mart�n Fern�ndez', 0, 'Avenida de la Constituci�n 30, Sevilla', '633778899', '1982-10-19'),
('Diego G�mez S�nchez', 1, 'Calle del Carmen 40, Valencia', '644112233', '1991-11-25'),
('Elena Rodr�guez Jim�nez', 0, 'Calle Alfonso I 15, Zaragoza', '655445566', '1988-02-15'),
('Pablo S�nchez Mart�nez', 1, 'Calle Mayor 5, Salamanca', '611556677', '1994-06-30'),
('Laura P�rez G�mez', 0, 'Plaza Mayor 8, M�laga', '622778899', '1983-03-02'),
('�ngela Mart�nez L�pez', 0, 'Calle Larios 10, M�laga', '633112233', '1996-09-14'),
('Daniel Rodr�guez S�nchez', 1, 'Calle Alcalde �ngel 15, Murcia', '644556677', '1987-12-22'),
('Natalia P�rez Garc�a', 0, 'Avenida de la Libertad 18, Granada', '655889900', '1992-04-10'),
('Alejandro G�mez Mart�nez', 1, 'Calle Alcal� 35, Madrid', '611112233', '1989-01-20'),
('Andrea Mart�n S�nchez', 0, 'Calle Tetu�n 20, Madrid', '622334455', '1993-08-05'),
('Hugo P�rez Mart�nez', 1, 'Calle Mayor 25, Madrid', '633556677', '1984-07-18'),
('Clara Gonz�lez Rodr�guez', 0, 'Calle Alcalde Juan 5, Madrid', '644778899', '1990-02-03'),
('David Fern�ndez P�rez', 1, 'Calle Mayor 10, Madrid', '655112233', '1985-06-12'),
('Mar�a L�pez Garc�a', 0, 'Calle Gran V�a 20, Madrid', '611334455', '1997-10-08'),
('Marcos Mart�nez Rodr�guez', 1, 'Paseo de la Castellana 15, Madrid', '622556677', '1982-09-21'),
('Sof�a G�mez Mart�n', 0, 'Calle Alcal� 30, Madrid', '633778899', '1994-05-16'),
('Lucas S�nchez P�rez', 1, 'Calle Mayor 8, Madrid', '644112233', '1981-08-29'),
('Paula Mart�nez Gonz�lez', 0, 'Calle Gran V�a 5, Madrid', '655445566', '1995-12-17'),
('Mateo P�rez L�pez', 1, 'Calle Serrano 20, Madrid', '611556677', '1988-03-25'),
('Valeria Gonz�lez Mart�nez', 0, 'Calle Mayor 12, Madrid', '622778899', '1993-11-04'),
('Santiago Rodr�guez Fern�ndez', 1, 'Calle Alcal� 25, Madrid', '633112233', '1986-04-14'),
('Emma L�pez P�rez', 0, 'Calle Gran V�a 35, Madrid', '644556677', '1990-09-09'),
('Abril Mart�nez G�mez', 1, 'Calle Mayor 15, Madrid', '655889900', '1983-02-21'),
('Oliver P�rez Rodr�guez', 1, 'Calle Serrano 10, Madrid', '611112233', '1992-07-06'),
('Leire Gonz�lez S�nchez', 0, 'Paseo de la Castellana 18, Madrid', '622334455', '1987-12-29'),
('Maximiliano Mart�n Mart�nez', 1, 'Calle Gran V�a 10, Madrid', '633556677', '1994-06-03'),
('Carmen S�nchez Gonz�lez', 0, 'Calle Mayor 22, Madrid', '644778899', '1981-11-11'),
('Sergio Rodr�guez Mart�n', 1, 'Calle Alcal� 40, Madrid', '655112233', '1996-03-16'),
('Aurora Mart�nez S�nchez', 0, 'Calle Mayor 18, Madrid', '611334455', '1985-08-22'),
('Noah P�rez Gonz�lez', 1, 'Calle Mayor 12, Madrid', '622556677', '1990-12-03'),
('Julia G�mez Mart�nez', 0, 'Calle Mayor 8, Madrid', '633778899', '1983-09-14'),
('Iker L�pez P�rez', 1, 'Calle Serrano 15, Madrid', '644112233', '1995-02-25'),
('Valentina Mart�nez Rodr�guez', 0, 'Paseo de la Castellana 28, Madrid', '655445566', '1988-05-05'),
('Leonardo P�rez L�pez', 1, 'Calle Alcal� 20, Madrid', '611556677', '1993-10-07'),
('Camila Gonz�lez Fern�ndez', 0, 'Calle Mayor 5, Madrid', '622778899', '1986-11-18'),
('Luciano Mart�n G�mez', 1, 'Calle Gran V�a 18, Madrid', '633112233', '1991-04-23'),
('Alba S�nchez Mart�nez', 0, 'Calle Mayor 11, Madrid', '644556677', '1984-07-08'),
('�ker Rodr�guez S�nchez', 1, 'Calle Serrano 17, Madrid', '655889900', '1997-01-12'),
('Emma Mart�nez P�rez', 0, 'Calle Gran V�a 40, Madrid', '611112233', '1982-08-29'),
('Olivia P�rez Gonz�lez', 0, 'Calle Mayor 13, Madrid', '622334455', '1994-06-17'),
('Joel Gonz�lez Mart�nez', 1, 'Calle Serrano 30, Madrid', '633556677', '1981-03-04'),
('Alma Mart�n Rodr�guez', 0, 'Calle Mayor 33, Madrid', '644778899', '1990-09-20'),
('Mat�as S�nchez L�pez', 1, 'Calle Alcal� 45, Madrid', '655112233', '1983-12-31'),
('Eva Rodr�guez Fern�ndez', 0, 'Calle Gran V�a 38, Madrid', '611334455', '1992-07-24'),
('Gael P�rez Mart�nez', 1, 'Calle Serrano 22, Madrid', '622556677', '1987-10-16'),
('Luna Mart�nez S�nchez', 0, 'Calle Mayor 19, Madrid', '633778899', '1996-05-28'),
('Facundo Gonz�lez L�pez', 1, 'Calle Alcal� 60, Madrid', '644112233', '1989-11-11'),
('Valeria G�mez Rodr�guez', 0, 'Calle Gran V�a 50, Madrid', '655445566', '1995-08-03'),
('Benjam�n P�rez Mart�n', 1, 'Calle Serrano 5, Madrid', '611556677', '1982-01-15'),
('Carla Mart�nez Gonz�lez', 0, 'Calle Mayor 21, Madrid', '622778899', '1990-04-09'),
('Aaron S�nchez Rodr�guez', 1, 'Calle Alcal� 35, Madrid', '633112233', '1985-09-27'),
('Lola Rodr�guez Mart�nez', 0, 'Calle Gran V�a 45, Madrid', '644556677', '1992-02-18'),
('Bruno Mart�n S�nchez', 1, 'Calle Serrano 40, Madrid', '655889900', '1987-03-11'),
('Julieta L�pez P�rez', 0, 'Calle Mayor 25, Madrid', '611112233', '1994-06-05'),
('Lucas P�rez Gonz�lez', 1, 'Calle Gran V�a 20, Madrid', '622334455', '1981-12-20'),
('Victoria Gonz�lez Mart�nez', 0, 'Calle Alcal� 55, Madrid', '633556677', '1993-07-14'),
('Benicio Mart�nez L�pez', 1, 'Calle Mayor 28, Madrid', '644778899', '1984-05-02'),
('Aitana S�nchez P�rez', 0, 'Calle Gran V�a 48, Madrid', '655112233', '1990-08-06'),
('Lorenzo Rodr�guez Gonz�lez', 1, 'Calle Serrano 18, Madrid', '611334455', '1983-11-27'),
('Valentino Mart�n Mart�nez', 0, 'Calle Mayor 31, Madrid', '622556677', '1995-04-23'),
('Gabriela P�rez Rodr�guez', 1, 'Calle Alcal� 38, Madrid', '633778899', '1988-09-19'),
('Martina Gonz�lez S�nchez', 0, 'Calle Gran V�a 32, Madrid', '644112233', '1991-01-14'),
('Hugo Mart�nez L�pez', 1, 'Calle Mayor 38, Barcelona', '655445566', '1980-06-17'),
('Ainhoa Rodr�guez Mart�nez', 0, 'Calle Gran V�a 17, Barcelona', '611223344', '1992-11-23'),
('Dylan Garc�a Fern�ndez', 1, 'Calle Rambla 45, Barcelona', '622778899', '1984-08-30'),
('L�a P�rez S�nchez', 0, 'Calle Mayor 25, Barcelona', '633556677', '1995-03-10'),
('Ian Mart�nez Rodr�guez', 1, 'Avenida Diagonal 20, Barcelona', '644334455', '1983-07-01'),
('Maia Gonz�lez L�pez', 0, 'Calle Proven�a 10, Barcelona', '655667788', '1991-04-15'),
('Axel Rodr�guez P�rez', 1, 'Calle Passeig de Gr�cia 30, Barcelona', '611889900', '1988-12-04'),
('Irene Mart�n Mart�nez', 0, 'Carrer del Bisbe 5, Barcelona', '622112233', '1993-05-20'),
('Biel P�rez S�nchez', 1, 'Carrer de la Lluna 15, Barcelona', '633445566', '1987-09-09'),
('Ayla Gonz�lez Rodr�guez', 0, 'Carrer de la Barceloneta 20, Barcelona', '644778899', '1994-01-14'),
('Santiago Mart�nez L�pez', 1, 'Calle General Weyler 2, Sevilla', '655112233', '1982-08-17'),
('Manuela P�rez Garc�a', 0, 'Avenida de la Constituci�n 40, Sevilla', '611223344', '1995-03-26'),
('Diego Rodr�guez Mart�nez', 1, 'Calle Tetu�n 5, Sevilla', '622445566', '1989-11-08'),
('Laura Garc�a S�nchez', 0, 'Calle Alfonso XII 15, Sevilla', '633667788', '1984-07-02'),
('Miguel Mart�nez Rodr�guez', 1, 'Calle Mateos Gago 10, Sevilla', '644889900', '1992-05-19'),
('Elena P�rez L�pez', 0, 'Calle San Fernando 8, Sevilla', '655112233', '1981-10-12'),
('Mar�a Rodr�guez Mart�n', 0, 'Calle Santa Mar�a la Blanca 25, Toledo', '611334455', '1994-09-30'),
('Adri�n Mart�nez S�nchez', 1, 'Calle Real del Arrabal 20, Toledo', '622556677', '1983-04-23'),
('Sara L�pez Rodr�guez', 0, 'Calle de la Plata 15, Toledo', '633778899', '1991-12-06'),
('Pablo S�nchez Mart�nez', 1, 'Calle de la Ronda 30, Toledo', '644112233', '1986-08-09'),
('Carolina P�rez Garc�a', 0, 'Calle de la Merced 12, Toledo', '655445566', '1993-01-22'),
('Javier Mart�n L�pez', 1, 'Calle del Comercio 18, Valencia', '611556677', '1980-04-15'),
('Aitana Rodr�guez Mart�nez', 0, 'Calle de la Paz 20, Valencia', '622778899', '1992-10-28'),
('Hugo Mart�nez P�rez', 1, 'Calle de la Reina 8, Valencia', '633112233', '1987-06-03'),
('Luc�a P�rez Garc�a', 0, 'Calle de la Estrella 5, Valencia', '644556677', '1990-02-17'),
('David Rodr�guez Mart�n', 1, 'Calle de la Cruz 25, Valencia', '655889900', '1984-11-28'),
('Elena Mart�nez L�pez', 0, 'Calle de las Avellanas 30, Valencia', '611112233', '1997-07-09'),
('Sergio P�rez Rodr�guez', 1, 'Calle de la Linterna 15, Valencia', '622334455', '1982-03-13'),
('Isabella Garc�a Mart�nez', 0, 'Calle del Mercado 12, Valencia', '633556677', '1995-09-05'),
('Mart�n Rodr�guez P�rez', 1, 'Calle de la Paz 8, Bilbao', '644778899', '1983-12-20'),
('Aurora Mart�nez Garc�a', 0, 'Calle de la Esperanza 6, Bilbao', '655112233', '1990-07-15'),
('Adriana P�rez Mart�n', 0, 'Calle del Arenal 14, Bilbao', '611334455', '1985-04-28'),
('H�ctor Gonz�lez L�pez', 1, 'Calle de la Ribera 10, Bilbao', '622556677', '1992-01-31'),
('Carmen Rodr�guez S�nchez', 0, 'Calle de la Alh�ndiga 5, Bilbao', '633778899', '1981-08-14'),
('Maximiliano Mart�nez Rodr�guez', 1, 'Calle del Ensanche 20, Bilbao', '644112233', '1996-05-27'),
('Marta Garc�a Mart�n', 0, 'Calle de San Francisco 8, Bilbao', '655445566', '1984-10-09'),
('Bruno P�rez L�pez', 1, 'Calle de la Gran V�a 15, Bilbao', '611556677', '1991-03-22'),
('Clara Mart�nez Rodr�guez', 0, 'Calle de la Plaza Nueva 25, Bilbao', '622334455', '1987-09-16'),
('Gabriel Rodr�guez Mart�n', 1, 'Calle de la Victoria 30, Bilbao', '633556677', '1994-12-08'),
('Elena L�pez P�rez', 0, 'Calle de la Diputaci�n 18, Bilbao', '644778899', '1983-07-21'),
('Alejandro P�rez Mart�nez', 1, 'Calle Mayor 10, Valencia', '622112233', '1990-12-03'),
('Isabel G�mez Rodr�guez', 0, 'Calle Real 20, Valencia', '633778899', '1983-09-14'),
('Carlos L�pez P�rez', 1, 'Calle de la Palma 15, Valencia', '644445566', '1995-02-25'),
('Paula Mart�nez Fern�ndez', 0, 'Plaza Mayor 28, Valencia', '655556677', '1988-05-05'),
('Adri�n P�rez L�pez', 1, 'Avenida de las Flores 20, Valencia', '611223344', '1993-10-07'),
('Natalia Gonz�lez Garc�a', 0, 'Calle de San Vicente 35, Valencia', '622334455', '1986-11-18'),
('Samuel Mart�n Rodr�guez', 1, 'Calle del Carmen 10, Valencia', '633667788', '1991-04-23'),
('Julia S�nchez Mart�nez', 0, 'Calle de las Rosas 15, Valencia', '644889900', '1984-07-08'),
('Diego Rodr�guez L�pez', 1, 'Avenida del Puerto 18, Valencia', '655112233', '1997-01-12'),
('Martina Mart�nez P�rez', 0, 'Calle de San Jos� 25, Valencia', '611778899', '1982-08-29'),
('Alonso P�rez Gonz�lez', 1, 'Calle del Mar 30, Valencia', '622556677', '1994-06-17'),
('Emma Rodr�guez Mart�n', 0, 'Calle del Pilar 40, Valencia', '633334455', '1981-03-04'),
('Ainhoa Mart�nez S�nchez', 0, 'Calle de la Paz 35, Valencia', '644556677', '1990-09-20'),
('Jorge Rodr�guez Rodr�guez', 1, 'Calle de las Palmas 50, Valencia', '655889900', '1993-12-31'),
('Valeria L�pez Fern�ndez', 0, 'Avenida de las Delicias 38, Valencia', '611112233', '1982-07-24'),
('Lucas Gonz�lez Gonz�lez', 1, 'Calle de X�tiva 22, Valencia', '622334455', '1987-10-16'),
('Marta Mart�n Mart�nez', 0, 'Calle de las Comedias 19, Valencia', '633556677', '1996-05-28'),
('Pablo S�nchez P�rez', 1, 'Calle de Col�n 60, Valencia', '644112233', '1989-11-11'),
('Laura Rodr�guez Fern�ndez', 0, 'Calle del Palau 50, Valencia', '655445566', '1995-08-03'),
('Alejandro P�rez L�pez', 1, 'Calle de las Animas 5, Valencia', '611223344', '1982-01-15'),
('Sara Mart�nez Rodr�guez', 0, 'Calle de la Albufera 35, Valencia', '622778899', '1990-04-09'),
('Mario Gonz�lez P�rez', 1, 'Calle del Marqu�s de Sotelo 12, Valencia', '633112233', '1985-09-27'),
('Aitana Rodr�guez Fern�ndez', 0, 'Calle de la Reina 25, Valencia', '644556677', '1992-02-18'),
('Carlos Mart�n Mart�nez', 1, 'Calle del General Urrutia 18, Valencia', '655889900', '1987-03-11'),
('Carmen P�rez S�nchez', 0, 'Calle de San Vicente M�rtir 22, Valencia', '611112233', '1994-06-05'),
('Miguel Gonz�lez Gonz�lez', 1, 'Calle de la Paz 15, Valencia', '622334455', '1981-12-20'),
('Natalia Mart�nez Rodr�guez', 0, 'Calle de la Sangre 30, Valencia', '633778899', '1993-07-14'),
('Luc�a P�rez Mart�nez', 1, 'Calle de los Derechos 28, Valencia', '644778899', '1984-05-02'),
('Javier Gonz�lez L�pez', 0, 'Calle de San Francisco 8, Valencia', '655112233', '1990-08-06'),
('Carla Rodr�guez Rodr�guez', 1, 'Calle del Doctor Zamenhof 15, Valencia', '611334455', '1983-11-27'),
('Santiago Mart�nez P�rez', 0, 'Calle de la Paz 8, Sevilla', '622556677', '1995-04-23'),
('Laura P�rez Gonz�lez', 1, 'Calle del Aire 38, Sevilla', '633778899', '1988-09-19'),
('Lucas Rodr�guez Mart�nez', 0, 'Calle de la Reja 32, Sevilla', '644112233', '1991-01-14'),
('Alicia Gonz�lez S�nchez', 1, 'Calle del Arquillo 5, Sevilla', '655445566', '1980-06-17'),
('Marcos P�rez Mart�nez', 1, 'Calle Mayor 10, Barcelona', '622112233', '1990-12-03'),
('Sof�a G�mez Rodr�guez', 0, 'Avenida Diagonal 20, Barcelona', '633778899', '1983-09-14'),
('Hugo L�pez P�rez', 1, 'Calle del Pilar 15, Barcelona', '644445566', '1995-02-25'),
('Valentina Mart�nez Fern�ndez', 0, 'Calle de Provenza 28, Barcelona', '655556677', '1988-05-05'),
('Luc�a P�rez L�pez', 0, 'Calle de la Rambla 20, Barcelona', '611223344', '1993-10-07'),
('Javier Gonz�lez Garc�a', 1, 'Passeig de Gr�cia 35, Barcelona', '622334455', '1986-11-18'),
('Marina Mart�n Rodr�guez', 0, 'Carrer de Mallorca 10, Barcelona', '633667788', '1991-04-23'),
('Mateo S�nchez Mart�nez', 1, 'Carrer de Muntaner 15, Barcelona', '644889900', '1984-07-08'),
('Nora Rodr�guez L�pez', 0, 'Carrer de Balmes 18, Barcelona', '655112233', '1997-01-12'),
('Leo Mart�nez P�rez', 1, 'Carrer de Valencia 25, Barcelona', '611778899', '1982-08-29'),
('Abril P�rez Gonz�lez', 0, 'Carrer de Proven�a 30, Barcelona', '622556677', '1994-06-17'),
('H�ctor Garc�a P�rez', 1, 'Calle de la Reina Mercedes 12, Vizcaya', '633889900', '1990-08-16'),
('Eva Mart�nez Rodr�guez', 0, 'Calle de San Sebasti�n 5, Zaragoza', '644223344', '1983-11-21'),
('Marta Rodr�guez S�nchez', 0, 'Avenida de la Palmera 20, Sevilla', '655556677', '1996-04-05'),
('Diego Gonz�lez Mart�nez', 1, 'Calle del Postigo 15, Alicante', '611334455', '1981-07-13'),
('Sara Mart�nez L�pez', 0, 'Calle de la Malagueta 25, M�laga', '622667788', '1994-10-28'),
('Pablo P�rez Rodr�guez', 1, 'Calle de los Geranios 30, Murcia', '633445566', '1987-02-04'),
('Luc�a Garc�a Mart�nez', 0, 'Calle del Orz�n 8, A Coru�a', '644778899', '1992-05-17'),
('Daniel L�pez Rodr�guez', 1, 'Calle del Rinc�n 10, Vizcaya', '655112233', '1985-12-03'),
('Alba Mart�nez S�nchez', 0, 'Calle del Acuario 15, Zaragoza', '611889900', '1993-09-09'),
('Alejandro P�rez Mart�nez', 1, 'Calle de Luis Montoto 18, Sevilla', '633112233', '1980-06-25'),
('Laura G�mez Rodr�guez', 0, 'Calle de las Lomas 25, Alicante', '644334455', '1991-03-10'),
('Carlos L�pez P�rez', 1, 'Avenida de Blas Infante 20, M�laga', '655667788', '1984-08-18'),
('Sof�a Mart�nez L�pez', 0, 'Calle del Carmen 30, Murcia', '611223344', '1995-01-27'),
('Javier Gonz�lez Rodr�guez', 1, 'Calle de la Marina 8, A Coru�a', '622556677', '1983-04-14'),
('Elena Rodr�guez Mart�nez', 0, 'Calle de los M�rtires 15, Vizcaya', '633778899', '1990-07-02'),
('Diego Mart�nez P�rez', 1, 'Calle del Tempranillo 10, Zaragoza', '644556677', '1986-02-16'),
('Luc�a P�rez L�pez', 0, 'Calle de Gamazo 25, Sevilla', '655889900', '1991-09-22'),
('Alejandro Rodr�guez Garc�a', 1, 'Calle de la Explanada 12, Alicante', '611112233', '1982-12-07'),
('Mar�a L�pez Mart�nez', 0, 'Calle de la Alameda 20, M�laga', '622334455', '1997-11-04'),
('Iv�n P�rez Rodr�guez', 1, 'Calle de la Gloria 28, Murcia', '633556677', '1984-05-31'),
('Sara Mart�nez S�nchez', 0, 'Calle de Santa Cristina 15, A Coru�a', '644778899', '1992-08-14'),
('Carlos Garc�a P�rez', 1, 'Calle de Gregorio Mara��n 10, Vizcaya', '655112233', '1983-01-29'),
('Luc�a L�pez Rodr�guez', 0, 'Calle de las Delicias 30, Zaragoza', '611334455', '1996-06-07'),
('Daniel Mart�nez L�pez', 1, 'Calle de San Fernando 18, Sevilla', '622667788', '1981-03-03'),
('Sergio Rodr�guez S�nchez', 1, 'Calle del Conde de Rodezno 15, Logro�o', '633445566', '1994-05-12'),
('Marina L�pez Mart�nez', 0, 'Plaza del Castillo 20, Pamplona', '644889900', '1987-08-21'),
('Lucas P�rez Rodr�guez', 1, 'Calle de la Estafeta 30, Pamplona', '655112233', '1990-02-14'),
('Aitana Mart�nez L�pez', 0, 'Calle de las Bardenas Reales 35, Tudela', '611778899', '1983-11-07'),
('Pablo Gonz�lez P�rez', 1, 'Calle de San Nicol�s 25, Tudela', '622556677', '1996-06-24'),
('Elena Rodr�guez Mart�n', 0, 'Calle de las Tejeras 40, Logro�o', '633778899', '1981-09-17'),
('Hugo Mart�nez Rodr�guez', 1, 'Avenida de la Paz 28, Logro�o', '644445566', '1993-04-03'),
('Julia P�rez L�pez', 0, 'Calle de San Juan 18, Logro�o', '655667788', '1986-01-29'),
('Adri�n Garc�a Mart�nez', 1, 'Calle de la Alberca 12, Logro�o', '611334455', '1991-08-12'),
('Sara L�pez Rodr�guez', 0, 'Calle del Espol�n 15, Burgos', '622112233', '1984-03-25'),
('Iv�n Mart�nez P�rez', 1, 'Calle de la Merced 20, Burgos', '633667788', '1997-10-09'),
('Mar�a Garc�a L�pez', 0, 'Calle de San Lesmes 25, Burgos', '644778899', '1982-07-14'),
('Alejandro P�rez Mart�n', 1, 'Calle de Fern�n Gonz�lez 30, Burgos', '655889900', '1995-12-28'),
('Luc�a Mart�n S�nchez', 0, 'Plaza Mayor 8, Salamanca', '611112233', '1983-05-01'),
('David Rodr�guez L�pez', 1, 'Calle de la R�a Mayor 10, Salamanca', '622334455', '1990-10-16'),
('Carla L�pez Mart�nez', 0, 'Calle de Toro 15, Salamanca', '633556677', '1985-04-30'),
('Javier Gonz�lez P�rez', 1, 'Calle de la Compa��a 20, Salamanca', '644112233', '1992-09-15'),
('Marta Rodr�guez Mart�n', 0, 'Calle de San Pablo 25, Salamanca', '655445566', '1981-06-11'),
('Diego Mart�nez S�nchez', 1, 'Calle del Prior 30, Le�n', '611223344', '1994-11-26'),
('Luc�a P�rez Rodr�guez', 0, 'Calle de la R�a 35, Le�n', '622667788', '1987-02-22'),
('Carlos Mart�n L�pez', 1, 'Calle de Santa Ana 40, Le�n', '633112233', '1990-07-07'),
('Elena Gonz�lez Mart�nez', 0, 'Calle de las Azucenas 18, Le�n', '644889900', '1983-09-03'),
('Sergio Rodr�guez P�rez', 1, 'Calle de San Juan 22, Palencia', '655667788', '1996-04-19'),
('Marina Mart�nez Gonz�lez', 0, 'Calle de Mayor 25, Palencia', '611112233', '1981-12-15'),
('Lucas P�rez Rodr�guez', 1, 'Calle de la Puebla 30, Palencia', '622112233', '1994-05-10'),
('Valentina Gonz�lez L�pez', 0, 'Calle de Mayor Antigua 35, Palencia', '633778899', '1987-10-27'),
('Daniel L�pez Mart�nez', 1, 'Plaza Mayor 8, Zamora', '644445566', '1990-03-14'),
('Luc�a Mart�nez Rodr�guez', 0, 'Calle de la Horta 12, Zamora', '655112233', '1983-08-28'),
('Alejandro P�rez S�nchez', 1, 'Calle de Santa Clara 20, Zamora', '611778899', '1996-01-05'),
('Mar�a Garc�a Mart�nez', 0, 'Calle de Balborraz 25, Zamora', '622334455', '1981-06-21'),
('Sergio Rodr�guez L�pez', 1, 'Calle de la Almendra 30, �vila', '633556677', '1994-11-16'),
('Valeria Mart�nez P�rez', 0, 'Calle del Rastro 35, �vila', '644889900', '1987-04-02'),
('Javier Gonz�lez Rodr�guez', 1, 'Calle del Rey 18, �vila', '655667788', '1990-09-19'),
('Sara P�rez Mart�nez', 0, 'Calle de la Cruz 20, �vila', '611334455', '1983-12-24'),
('Adri�n Garc�a L�pez', 1, 'Calle de las Hervencias 25, Segovia', '622556677', '1996-07-11'),
('Marta L�pez Garc�a', 0, 'Calle del Puente de San Lorenzo 30, Segovia', '633778899', '1981-02-06'),
('Daniel P�rez Mart�nez', 1, 'Plaza Mayor 8, Segovia', '644445566', '1994-05-23'),
('Luc�a Rodr�guez L�pez', 0, 'Calle del Valle de Luna 12, Segovia', '655112233', '1987-10-08'),
('Sergio Mart�nez Rodr�guez', 1, 'Calle de San Quirce 20, Soria', '611223344', '1990-03-03'),
('Santiago Mart�nez P�rez', 1, 'Calle de La Alameda 18, Cuenca', '655889900', '1994-09-10'),
('Valentina Rodr�guez Mart�nez', 0, 'Calle de Los Tintes 20, Cuenca', '611334455', '1987-02-05'),
('Iker Garc�a L�pez', 1, 'Calle de Los Tiradores 25, Cuenca', '622556677', '1990-07-30'),
('Luc�a Mart�nez Rodr�guez', 0, 'Calle de La Ciudad Encantada 30, Cuenca', '633778899', '1983-11-18'),
('Marcos P�rez Mart�nez', 1, 'Calle del Alfonso VIII 35, Toledo', '644445566', '1996-04-03'),
('Marta L�pez Rodr�guez', 0, 'Calle de San Mart�n 40, Toledo', '655667788', '1981-07-26'),
('Sara Garc�a Mart�nez', 1, 'Calle de La Plata 18, Toledo', '611112233', '1994-12-19'),
('Javier Mart�nez L�pez', 0, 'Calle del Greco 20, Toledo', '622334455', '1987-05-14'),
('Elena P�rez Rodr�guez', 1, 'Calle de Santa Isabel 25, Toledo', '633556677', '1990-10-09'),
('Adri�n Rodr�guez Mart�nez', 0, 'Calle de La Ronda 30, Toledo', '644112233', '1983-03-04'),
('Luc�a Garc�a P�rez', 1, 'Calle de La Merced 12, �vila', '655445566', '1996-06-27'),
('Daniel L�pez Mart�nez', 0, 'Calle del Rastro 15, �vila', '611223344', '1981-09-21'),
('Sara Mart�nez P�rez', 1, 'Calle del Duque de Alba 20, �vila', '622667788', '1994-12-16'),
('Iv�n Gonz�lez L�pez', 0, 'Calle de La Victoria 25, �vila', '633112233', '1987-11-11'),
('Valeria Rodr�guez Mart�nez', 1, 'Calle de Los Reyes Cat�licos 30, Segovia', '644889900', '1990-02-06'),
('Diego L�pez P�rez', 0, 'Calle de La Juder�a 35, Segovia', '655112233', '1983-05-31'),
('Marina Mart�nez Garc�a', 1, 'Calle de San Andr�s 18, Segovia', '611778899', '1996-10-26'),
('Sergio Rodr�guez L�pez', 0, 'Calle de La Moneda 20, Segovia', '622112233', '1981-01-14'),
('Luc�a P�rez Mart�nez', 1, 'Calle de Las Parras 25, Soria', '633667788', '1994-08-09'),
('Carlos L�pez Rodr�guez', 0, 'Calle de Los Pastores 30, Soria', '644445566', '1987-02-04'),
('Elena Mart�nez P�rez', 1, 'Calle del Collado 35, Soria', '655667788', '1990-05-21'),
('Javier Rodr�guez Mart�nez', 0, 'Calle del Oeste 40, Soria', '611334455', '1983-10-16'),
('Mar�a Garc�a L�pez', 1, 'Calle de La Vega 18, Guadalajara', '622556677', '1996-03-12'),
('Laura P�rez Mart�nez', 0, 'Calle Mayor 10, Guadalajara', '633445566', '1994-05-12'),
('Alejandro Gonz�lez Rodr�guez', 1, 'Calle del Reloj 20, Guadalajara', '644889900', '1987-08-21'),
('Sof�a Mart�nez L�pez', 0, 'Calle del Carmen 30, Guadalajara', '655112233', '1990-02-14'),
('Daniel P�rez S�nchez', 1, 'Calle del Cervantes 35, Guadalajara', '611778899', '1983-11-07'),
('Marta L�pez Mart�nez', 0, 'Calle de la Plaza Mayor 25, Guadalajara', '622556677', '1996-06-24'),
('Lucas Rodr�guez P�rez', 1, 'Calle del Parque 40, Guadalajara', '633778899', '1981-09-17'),
('Sara Garc�a Mart�n', 0, 'Calle del Pilar 28, Guadalajara', '644445566', '1993-04-03'),
('Hugo P�rez Garc�a', 1, 'Calle de San Roque 22, Guadalajara', '655667788', '1986-01-29'),
('Paula L�pez Rodr�guez', 0, 'Calle de la Fuente 15, Guadalajara', '611334455', '1991-08-12'),
('Diego Mart�nez Mart�n', 1, 'Calle de la Estrella 20, Guadalajara', '622112233', '1994-03-25'),
('Luc�a P�rez L�pez', 0, 'Calle de la Iglesia 25, Guadalajara', '633667788', '1987-07-14'),
('Javier Gonz�lez Mart�nez', 1, 'Calle del Campo 30, Guadalajara', '644778899', '1990-12-28'),
('Carla Rodr�guez L�pez', 0, 'Calle del R�o 12, Guadalajara', '655889900', '1983-05-01'),
('Marcos Mart�nez P�rez', 1, 'Calle de la Torre 20, Guadalajara', '611112233', '1996-10-16'),
('Elena Garc�a Rodr�guez', 0, 'Calle del Sol 25, Guadalajara', '622334455', '1981-04-22'),
('Pablo L�pez Mart�nez', 1, 'Calle de la Luna 30, Guadalajara', '633556677', '1994-11-26'),
('Valentina Rodr�guez L�pez', 0, 'Calle de la Monta�a 35, Guadalajara', '644889900', '1987-10-27'),
('Iv�n Mart�nez P�rez', 1, 'Calle de la Ladera 40, Guadalajara', '655112233', '1990-07-30'),
('Luc�a Garc�a Rodr�guez', 0, 'Calle de la Colina 18, Guadalajara', '611778899', '1983-12-19'),
('Carlos P�rez Mart�nez', 1, 'Calle del Paseo 20, Guadalajara', '622667788', '1996-06-27'),
('Eva Mart�nez L�pez', 0, 'Calle de la Vega 25, Guadalajara', '633112233', '1981-02-06'),
('Sergio Gonz�lez P�rez', 1, 'Calle de la Rambla 30, Guadalajara', '644445566', '1994-05-23'),
('Marina L�pez Rodr�guez', 0, 'Calle de la Avenida 35, Guadalajara', '655112233', '1987-10-08'),
('Javier Mart�nez S�nchez', 1, 'Calle de la Cuesta 18, Guadalajara', '611223344', '1990-03-03'),
('Luc�a P�rez Mart�nez', 0, 'Calle de la Sierra 25, Madrid', '633667788', '1984-07-10'),
('Adri�n Mart�nez Rodr�guez', 1, 'Calle del Carmen 30, Barcelona', '644889900', '1997-01-15'),
('Valeria Gonz�lez L�pez', 0, 'Calle del Mar 35, Valencia', '655667788', '1982-03-20'),
('Javier P�rez Mart�nez', 1, 'Calle de la Cruz 18, Sevilla', '611112233', '1995-08-25'),
('Marta Mart�nez L�pez', 0, 'Calle del Paseo 20, Bilbao', '622334455', '1980-11-30'),
('Diego Rodr�guez P�rez', 1, 'Calle de la Feria 25, M�laga', '633556677', '1993-06-05'),
('Elena Garc�a Mart�nez', 0, 'Calle del Sol 30, Alicante', '644445566', '1986-09-17'),
('Lucas Mart�nez Rodr�guez', 1, 'Calle del Mar 35, Valencia', '655889900', '1991-12-10'),
('Sara P�rez L�pez', 0, 'Calle de la Luna 18, Zaragoza', '611223344', '1984-05-15'),
('Adri�n Rodr�guez Mart�nez', 1, 'Calle de la Plaza 20, M�laga', '622556677', '1997-10-01'),
('Valentina L�pez P�rez', 0, 'Calle del Carmen 25, Sevilla', '633778899', '1982-01-28'),
('Alejandro Mart�nez L�pez', 1, 'Calle del Mar 30, Barcelona', '644112233', '1995-04-20'),
('Luc�a P�rez Garc�a', 0, 'Calle de la Cruz 35, Valencia', '655445566', '1987-07-03'),
('Sergio Rodr�guez Mart�nez', 1, 'Calle del Sol 18, Alicante', '611778899', '1990-10-18'),
('Marina Garc�a L�pez', 0, 'Calle de la Feria 20, M�laga', '622112233', '1983-03-05'),
('Diego Mart�nez P�rez', 1, 'Calle de la Luna 25, Zaragoza', '633667788', '1996-08-28'),
('Eva L�pez Mart�nez', 0, 'Calle del Mar 30, Barcelona', '644889900', '1981-11-12'),
('Marcos Rodr�guez L�pez', 1, 'Calle del Paseo 35, Bilbao', '655667788', '1994-02-14'),
('Luc�a Mart�nez P�rez', 0, 'Calle del Carmen 18, Sevilla', '611334455', '1987-05-09'),
('Carlos Gonz�lez Mart�nez', 1, 'Calle del Sol 20, Alicante', '622556677', '1990-12-02'),
('Sara L�pez Rodr�guez', 0, 'Calle de la Cruz 25, Valencia', '633778899', '1983-04-17'),
('Lucas Mart�nez P�rez', 1, 'Calle del Mar 30, Barcelona', '644445566', '1996-09-28'),
('Valentina Rodr�guez L�pez', 0, 'Calle de la Feria 35, M�laga', '655889900', '1981-08-12'),
('Sergio P�rez Garc�a', 1, 'Calle del Sol 18, Alicante', '611112233', '1994-11-03'),
('Marina Mart�nez Rodr�guez', 0, 'Calle del Paseo 20, Bilbao', '622334455', '1987-02-26'),
('Diego L�pez Mart�nez', 1, 'Calle de la Luna 25, Zaragoza', '633556677', '1990-05-19'),
('Elena Garc�a L�pez', 0, 'Calle del Mar 30, Barcelona', '644889900', '1983-12-07'),
('Adri�n Mart�nez P�rez', 1, 'Calle del Sol 35, Alicante', '655112233', '1996-10-20'),
('Valeria L�pez Rodr�guez', 0, 'Calle de la Feria 18, M�laga', '611223344', '1981-03-01'),
('Santiago Mart�nez P�rez', 1, 'Calle Mayor 10, Madrid', '633445566', '1994-05-12'),
('Marina L�pez Mart�nez', 0, 'Calle del Carmen 20, Barcelona', '644889900', '1987-08-21'),
('Lucas P�rez Rodr�guez', 1, 'Calle de la Playa 30, Valencia', '655112233', '1990-02-14'),
('Aitana Mart�nez L�pez', 0, 'Calle del Sol 35, Sevilla', '611778899', '1983-11-07'),
('Pablo Gonz�lez P�rez', 1, 'Calle Mayor 40, Bilbao', '622556677', '1996-06-24'),
('Elena Rodr�guez Mart�n', 0, 'Calle de la Feria 25, M�laga', '633778899', '1981-09-17'),
('Hugo Mart�nez Rodr�guez', 1, 'Calle del Paseo 28, Alicante', '644445566', '1993-04-03'),
('Julia P�rez L�pez', 0, 'Calle del Mar 22, Zaragoza', '655667788', '1986-01-29'),
('Adri�n Garc�a Mart�nez', 1, 'Calle de la Plaza 12, Palma de Mallorca', '611334455', '1991-08-12'),
('Sara L�pez Rodr�guez', 0, 'Calle del Sol 15, Santa Cruz de Tenerife', '622112233', '1984-03-25'),
('Iv�n Mart�nez P�rez', 1, 'Calle del Carmen 20, Las Palmas de Gran Canaria', '633667788', '1997-10-09'),
('Mar�a Garc�a L�pez', 0, 'Calle de la Playa 25, Murcia', '644778899', '1982-07-14'),
('Alejandro P�rez Mart�n', 1, 'Calle Mayor 30, C�rdoba', '655889900', '1995-12-28'),
('Luc�a Mart�n S�nchez', 0, 'Calle del Paseo 8, Vigo', '611112233', '1983-05-01'),
('David Rodr�guez L�pez', 1, 'Calle del Mar 10, Gij�n', '622334455', '1990-10-16'),
('Carla L�pez Mart�nez', 0, 'Calle del Sol 15, Hospitalet de Llobregat', '633556677', '1985-04-30'),
('Javier Gonz�lez P�rez', 1, 'Calle Mayor 20, Badalona', '644112233', '1992-09-15'),
('Marta Rodr�guez Mart�n', 0, 'Calle del Carmen 25, Hospitalet de Llobregat', '655445566', '1981-06-11'),
('Diego Mart�nez S�nchez', 1, 'Calle del Mar 30, Terrassa', '611223344', '1994-11-26'),
('Luc�a P�rez Rodr�guez', 0, 'Calle del Paseo 35, Sabadell', '622667788', '1987-02-22'),
('Carlos Mart�n L�pez', 1, 'Calle Mayor 40, Tarragona', '633112233', '1990-07-07'),
('Elena Gonz�lez Mart�nez', 0, 'Calle del Carmen 18, Girona', '644889900', '1983-09-03'),
('Sergio Rodr�guez P�rez', 1, 'Calle del Sol 22, Reus', '655667788', '1996-04-19'),
('Marina Mart�nez Gonz�lez', 0, 'Calle Mayor 25, Salamanca', '611112233', '1981-12-15'),
('Lucas P�rez Rodr�guez', 1, 'Calle del Mar 30, Logro�o', '622112233', '1994-05-10'),
('Valentina Gonz�lez L�pez', 0, 'Calle del Paseo 35, Logro�o', '633778899', '1987-10-27'),
('Daniel L�pez Mart�nez', 1, 'Calle del Carmen 12, Logro�o', '644445566', '1990-03-14'),
('Luc�a Mart�nez Rodr�guez', 0, 'Calle Mayor 15, Burgos', '655112233', '1983-08-28'),
('Laura P�rez Mart�nez', 0, 'Calle de Alcal� 25, Madrid', '633445566', '1984-07-10'),
('Alejandro Gonz�lez Rodr�guez', 1, 'Avenida Diagonal 30, Barcelona', '644889900', '1997-01-15'),
('Sof�a Mart�nez L�pez', 0, 'Calle de Valencia 35, Valencia', '655667788', '1982-03-20'),
('Daniel P�rez S�nchez', 1, 'Calle Gran V�a 18, Madrid', '611112233', '1995-08-25'),
('Marta L�pez Mart�nez', 0, 'Calle del Casco Viejo 20, Bilbao', '622334455', '1980-11-30'),
('Lucas Rodr�guez P�rez', 1, 'Pla�a Catalunya 25, Barcelona', '633556677', '1993-06-05'),
('Elena Garc�a Mart�nez', 0, 'Calle Mayor 30, Valencia', '644445566', '1986-09-17'),
('Lucas Mart�nez Rodr�guez', 1, 'Paseo de Gracia 35, Barcelona', '655889900', '1991-12-10'),
('Sara P�rez L�pez', 0, 'Gran V�a 18, Madrid', '611223344', '1984-05-15'),
('Adri�n Rodr�guez Mart�nez', 1, 'Calle de la Paz 20, M�laga', '622556677', '1997-10-01'),
('Valentina L�pez P�rez', 0, 'Calle Larios 25, M�laga', '633778899', '1982-01-28'),
('Alejandro Mart�nez L�pez', 1, 'Passeig de Gr�cia 30, Barcelona', '644112233', '1995-04-20'),
('Luc�a P�rez Garc�a', 0, 'Pla�a de la Reina 35, Valencia', '655445566', '1987-07-03'),
('Sergio Rodr�guez Mart�nez', 1, 'Carrer del Mar 18, Alicante', '611778899', '1990-10-18'),
('Marina Garc�a L�pez', 0, 'Plaza Mayor 20, M�laga', '622112233', '1983-03-05'),
('Diego Mart�nez P�rez', 1, 'Calle Alcazabilla 25, M�laga', '633667788', '1996-08-28'),
('Eva L�pez Mart�nez', 0, 'Carrer de Balmes 30, Barcelona', '644889900', '1981-11-12'),
('Marcos Rodr�guez L�pez', 1, 'Calle del Perro 35, Bilbao', '655667788', '1994-02-14'),
('Luc�a Mart�nez P�rez', 0, 'Plaza de Espa�a 18, Sevilla', '611334455', '1987-05-09'),
('Carlos Gonz�lez Mart�nez', 1, 'Carrer del Mar 20, Alicante', '622556677', '1990-12-02'),
('Sara L�pez Rodr�guez', 0, 'Calle Sierpes 25, Sevilla', '633778899', '1983-04-17'),
('Lucas Mart�nez P�rez', 1, 'Calle Larios 30, M�laga', '644445566', '1996-09-28'),
('Valentina Rodr�guez L�pez', 0, 'Calle Granada 35, Granada', '655889900', '1981-08-12'),
('Sergio P�rez Garc�a', 1, 'Plaza de la Virgen 18, Valencia', '611112233', '1994-11-03'),
('Marina Mart�nez Rodr�guez', 0, 'Calle de la Feria 20, Sevilla', '622334455', '1987-02-26'),
('Diego L�pez Mart�nez', 1, 'Calle de la Paz 25, Granada', '633556677', '1990-05-19'),
('Elena Garc�a L�pez', 0, 'Paseo de la Alameda 30, Valencia', '644889900', '1983-12-07'),
('Mateo Rodr�guez Mart�nez', 1, 'Calle Mayor 10, Toledo', '633445566', '1994-05-12'),
('Luna Mart�nez L�pez', 0, 'Calle del Sol 20, Valencia', '644889900', '1987-08-21'),
('Oliver P�rez Rodr�guez', 1, 'Calle de la Luna 30, Valladolid', '655112233', '1990-02-14'),
('Isabella L�pez Mart�nez', 0, 'Calle Mayor 35, Huelva', '611778899', '1983-11-07'),
('Leo Rodr�guez P�rez', 1, 'Calle del Mar 40, Huesca', '622556677', '1996-06-24'),
('Lola Garc�a Mart�nez', 0, 'Calle de la Estrella 25, Ja�n', '633778899', '1981-09-17'),
('Bruno Mart�nez Rodr�guez', 1, 'Calle del Paseo 30, Le�n', '644445566', '1993-04-03'),
('Abril P�rez L�pez', 0, 'Calle Mayor 35, Lleida', '655667788', '1986-01-29'),
('H�ctor Mart�nez P�rez', 1, 'Calle del Mar 40, Lugo', '611334455', '1991-08-12'),
('L�a P�rez Rodr�guez', 0, 'Calle de la Luna 18, Albacete', '622112233', '1984-03-25'),
('Olivia Garc�a Mart�nez', 1, 'Calle Mayor 20, Almer�a', '633667788', '1997-10-09'),
('Luca L�pez P�rez', 0, 'Calle del Carmen 25, �vila', '644778899', '1982-07-14'),
('Elsa Mart�nez Rodr�guez', 1, 'Calle del Sol 30, Badajoz', '655889900', '1995-12-28'),
('Gael Rodr�guez L�pez', 0, 'Calle Mayor 35, Barcelona', '611112233', '1983-05-01'),
('Emma P�rez Mart�nez', 1, 'Calle del Mar 40, Burgos', '622334455', '1990-10-16'),
('Nora Mart�nez L�pez', 0, 'Calle Mayor 45, C�ceres', '633556677', '1985-04-30'),
('Hugo L�pez Rodr�guez', 1, 'Calle del Carmen 50, C�diz', '644112233', '1992-09-15'),
('Vera Rodr�guez Mart�nez', 0, 'Calle de la Luna 55, Cantabria', '655445566', '1981-06-11'),
('Iker P�rez L�pez', 1, 'Calle del Mar 60, Castell�n', '611223344', '1994-11-26'),
('Sof�a Garc�a Rodr�guez', 0, 'Calle Mayor 65, Ciudad Real', '622667788', '1987-02-22'),
('Zoe Mart�nez P�rez', 1, 'Calle del Sol 70, C�rdoba', '633112233', '1990-07-07'),
('Le�n L�pez Mart�nez', 0, 'Calle Mayor 75, Cuenca', '644889900', '1983-09-03'),
('Maximiliano Rodr�guez L�pez', 1, 'Calle del Mar 80, Girona', '655667788', '1996-04-19'),
('Isla Mart�nez Rodr�guez', 0, 'Calle Mayor 85, Granada', '611112233', '1981-12-15'),
('Luciano P�rez Mart�nez', 1, 'Calle del Sol 90, Guadalajara', '622112233', '1994-05-10'),
('Ada L�pez P�rez', 0, 'Calle Mayor 95, Huelva', '633778899', '1987-10-27'),
('Milo Rodr�guez L�pez', 1, 'Calle del Mar 100, Huesca', '644445566', '1990-03-14'),
('M�a Mart�nez Rodr�guez', 0, 'Calle Mayor 105, Ja�n', '655112233', '1983-08-28');


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
('Camiseta de manga larga', 'Nike', 'M', 'Rojo', 'Algod�n', 29.99, 1, 100),
('Camiseta sin mangas', 'Adidas', 'L', 'Verde', 'Poli�ster', 19.99, 1, 200),
('Camiseta estampada', 'Puma', 'S', 'Amarillo', 'Algod�n', 24.99, 1, 150),
('Camiseta casual', 'Pull&Bear', 'L', 'Blanco', 'Algod�n', 19.99, 1, 130),
('Camiseta deportiva', 'Reebok', 'S', 'Verde', 'Poli�ster', 29.99, 1, 140),
('Camisa formal', 'Tommy Hilfiger', 'M', 'Azul', 'Algod�n', 49.99, 1, 120),
('Pantal�n vaquero ajustado', 'Levis', '32', 'Azul', 'Denim', 79.99, 2, 50),
('Pantal�n chino', 'Dockers', '34', 'Beige', 'Algod�n', 59.99, 2, 80),
('Pantal�n de lino', 'Zara', '36', 'Blanco', 'Lino', 69.99, 2, 60),
('Pantal�n cargo', 'Zara', '34', 'Verde', 'Algod�n', 39.99, 2, 110),
('Pantal�n de vestir', 'Hugo Boss', '36', 'Negro', 'Lana', 99.99, 2, 90),
('Pantal�n corto', 'H&M', '32', 'Azul', 'Denim', 29.99, 2, 100),
('Chaqueta de cuero', 'LeatherCraft', 'L', 'Negro', 'Cuero', 199.99, 3, 40),
('Chaqueta vaquera', 'Wrangler', 'M', 'Azul', 'Denim', 89.99, 3, 30),
('Chaqueta impermeable', 'The North Face', 'XL', 'Gris', 'Nailon', 159.99, 3, 70),
('Chaqueta bomber', 'Alpha Industries', 'M', 'Verde', 'Nailon', 149.99, 3, 60),
('Chaqueta de punto', 'Massimo Dutti', 'L', 'Gris', 'Lana', 119.99, 3, 50),
('Chaqueta de verano', 'Bershka', 'S', 'Beige', 'Algod�n', 59.99, 3, 70),
('Zapatillas running', 'Nike', '42', 'Rojo', 'Sint�tico', 99.99, 4, 100),
('Zapatillas casual', 'Vans', '41', 'Negro', 'Tela', 59.99, 4, 120),
('Botas de monta�a', 'Timberland', '43', 'Marr�n', 'Cuero', 139.99, 4, 60),
('Zapatillas de skate', 'DC Shoes', '42', 'Negro', 'Cuero', 89.99, 4, 80),
('Zapatillas de baloncesto', 'Jordan', '44', 'Rojo', 'Sint�tico', 139.99, 4, 60),
('Sandalias de verano', 'Birkenstock', '41', 'Marr�n', 'Cuero', 79.99, 4, 100),
('Jersey de lana', 'H&M', 'M', 'Gris', 'Lana', 49.99, 5, 50),
('Jersey cuello alto', 'Uniqlo', 'L', 'Negro', 'Algod�n', 39.99, 5, 70),
('Jersey navide�o', 'Primark', 'XL', 'Rojo', 'Acr�lico', 29.99, 5, 80),
('Jersey de algod�n', 'Uniqlo', 'M', 'Verde', 'Algod�n', 39.99, 5, 110),
('Jersey de cachemira', 'Ralph Lauren', 'L', 'Azul', 'Cachemira', 199.99, 5, 40),
('Jersey con cremallera', 'Zara', 'XL', 'Gris', 'Algod�n', 59.99, 5, 70),
('Sudadera deportiva', 'Nike', 'M', 'Azul', 'Poli�ster', 49.99, 6, 100),
('Sudadera con cremallera', 'Adidas', 'L', 'Negro', 'Algod�n', 59.99, 6, 90),
('Sudadera sin capucha', 'Reebok', 'S', 'Gris', 'Algod�n', 39.99, 6, 110),
('Sudadera b�sica', 'Nike', 'S', 'Rojo', 'Algod�n', 49.99, 6, 90),
('Sudadera con logo', 'Adidas', 'M', 'Blanco', 'Algod�n', 59.99, 6, 100),
('Sudadera oversized', 'Pull&Bear', 'L', 'Gris', 'Algod�n', 39.99, 6, 80),
('Top deportivo', 'Nike', 'M', 'Rosa', 'Poli�ster', 29.99, 7, 100),
('Top de encaje', 'Victoria Secret', 'S', 'Blanco', 'Encaje', 39.99, 7, 90),
('Top b�sico', 'H&M', 'L', 'Negro', 'Algod�n', 19.99, 7, 120),
('Top con tirantes', 'Stradivarius', 'M', 'Rosa', 'Algod�n', 19.99, 7, 120),
('Top de manga larga', 'Mango', 'S', 'Negro', 'Algod�n', 29.99, 7, 110),
('Top de encaje', 'Intimissimi', 'L', 'Blanco', 'Encaje', 39.99, 7, 100),
('Boxers', 'Calvin Klein', 'M', 'Blanco', 'Algod�n', 25.99, 8, 200),
('Sujetador deportivo', 'Nike', 'L', 'Negro', 'Poli�ster', 34.99, 8, 150),
('Camiseta t�rmica', 'Uniqlo', 'S', 'Azul', 'Poli�ster', 29.99, 8, 100),
('Boxers de algod�n', 'H&M', 'M', 'Negro', 'Algod�n', 15.99, 8, 150),
('Sujetador push-up', 'Victoria Secret', 'L', 'Rojo', 'Poli�ster', 49.99, 8, 90),
('Camiseta t�rmica', 'Uniqlo', 'S', 'Blanco', 'Poli�ster', 29.99, 8, 100),
('Shorts vaqueros', 'Levis', '32', 'Azul', 'Denim', 49.99, 9, 100),
('Shorts de ba�o', 'Speedo', 'L', 'Rojo', 'Poli�ster', 39.99, 9, 150),
('Shorts de deporte', 'Nike', 'M', 'Negro', 'Poli�ster', 29.99, 9, 120),
('Shorts casual', 'Zara', '32', 'Azul', 'Denim', 39.99, 9, 80),
('Shorts deportivos', 'Adidas', 'L', 'Negro', 'Poli�ster', 29.99, 9, 120),
('Shorts de playa', 'Quiksilver', 'M', 'Rojo', 'Poli�ster', 49.99, 9, 100),
('Abrigo largo', 'Mango', 'M', 'Beige', 'Lana', 129.99, 10, 50),
('Abrigo acolchado', 'Uniqlo', 'L', 'Negro', 'Poli�ster', 149.99, 10, 80),
('Abrigo de plumas', 'The North Face', 'XL', 'Azul', 'Plumas', 199.99, 10, 60),
('Abrigo elegante', 'Hugo Boss', 'M', 'Negro', 'Lana', 249.99, 10, 30),
('Abrigo informal', 'Uniqlo', 'L', 'Gris', 'Poli�ster', 129.99, 10, 70),
('Abrigo de invierno', 'Columbia', 'XL', 'Verde', 'Plumas', 199.99, 10, 60),
('Chaleco de lana', 'Massimo Dutti', 'L', 'Marr�n', 'Lana', 69.99, 11, 40),
('Chaleco de plumas', 'The North Face', 'M', 'Negro', 'Plumas', 129.99, 11, 60),
('Chaleco acolchado', 'Columbia', 'S', 'Azul', 'Poli�ster', 89.99, 11, 70),
('Chaleco de vestir', 'Massimo Dutti', 'M', 'Negro', 'Lana', 99.99, 11, 50),
('Chaleco casual', 'Zara', 'L', 'Azul', 'Algod�n', 49.99, 11, 40),
('Chaleco acolchado', 'The North Face', 'S', 'Gris', 'Poli�ster', 89.99, 11, 60),
('Conjunto de yoga', 'Lululemon', 'S', 'Rosa', 'Poli�ster', 89.99, 12, 100),
('Conjunto casual', 'H&M', 'M', 'Negro', 'Algod�n', 69.99, 12, 80),
('Conjunto deportivo', 'Adidas', 'L', 'Gris', 'Poli�ster', 99.99, 12, 70),
('Conjunto de pijama', 'Primark', 'S', 'Rosa', 'Algod�n', 29.99, 12, 100),
('Conjunto de traje', 'Zara', 'M', 'Negro', 'Lana', 199.99, 12, 50),
('Conjunto de entrenamiento', 'Nike', 'L', 'Gris', 'Poli�ster', 99.99, 12, 70),
('Camiseta b�sica', 'Uniqlo', 'S', 'Blanco', 'Algod�n', 9.99, 1, 200),
('Camiseta gr�fica', 'Urban Outfitters', 'M', 'Negro', 'Algod�n', 29.99, 1, 150),
('Camiseta ajustada', 'Zara', 'L', 'Rojo', 'Algod�n', 19.99, 1, 120),
('Camiseta con bolsillo', 'H&M', 'XL', 'Azul', 'Algod�n', 14.99, 1, 100),
('Camiseta de rayas', 'Mango', 'M', 'Blanco', 'Algod�n', 24.99, 1, 130),
('Camisa vaquera', 'Levis', 'L', 'Azul', 'Denim', 59.99, 1, 70),
('Camisa de cuadros', 'Burberry', 'S', 'Rojo', 'Algod�n', 149.99, 1, 90),
('Camisa de lino', 'Massimo Dutti', 'M', 'Beige', 'Lino', 69.99, 1, 60),
('Camisa de franela', 'Uniqlo', 'L', 'Verde', 'Algod�n', 39.99, 1, 80),
('Camisa con cuello mao', 'Zara', 'XL', 'Blanco', 'Algod�n', 29.99, 1, 100),
('Pantal�n pitillo', 'Topman', '30', 'Negro', 'Denim', 49.99, 2, 90),
('Pantal�n de pana', 'J.Crew', '32', 'Marr�n', 'Algod�n', 59.99, 2, 70),
('Pantal�n de ch�ndal', 'Nike', '34', 'Gris', 'Poli�ster', 39.99, 2, 110),
('Pantal�n de vestir slim', 'Hugo Boss', '36', 'Azul', 'Lana', 99.99, 2, 50),
('Pantal�n con pinzas', 'Zara', '30', 'Gris', 'Poli�ster', 49.99, 2, 80),
('Pantal�n palazzo', 'Mango', '32', 'Negro', 'Poli�ster', 69.99, 2, 90),
('Pantal�n jogger', 'Adidas', '34', 'Verde', 'Poli�ster', 59.99, 2, 100),
('Pantal�n cargo militar', 'Urban Outfitters', '36', 'Verde', 'Algod�n', 79.99, 2, 60),
('Pantal�n de ciclista', 'Rapha', '30', 'Negro', 'Lycra', 149.99, 2, 30),
('Pantal�n de pinzas', 'Massimo Dutti', '32', 'Azul', 'Algod�n', 59.99, 2, 70),
('Chaqueta de mezclilla', 'Levis', 'M', 'Azul', 'Denim', 89.99, 3, 80),
('Chaqueta parka', 'Canada Goose', 'L', 'Verde', 'Poli�ster', 299.99, 3, 50),
('Chaqueta softshell', 'The North Face', 'XL', 'Negro', 'Poli�ster', 159.99, 3, 60),
('Chaqueta de sastre', 'Tommy Hilfiger', 'M', 'Gris', 'Lana', 199.99, 3, 40),
('Chaqueta de borrego', 'Pull&Bear', 'L', 'Marr�n', 'Poli�ster', 89.99, 3, 70),
('Chaqueta cortavientos', 'Nike', 'S', 'Rojo', 'Nailon', 79.99, 3, 100),
('Chaqueta de terciopelo', 'Zara', 'XL', 'Negro', 'Poli�ster', 99.99, 3, 90),
('Chaqueta sahariana', 'Mango', 'M', 'Beige', 'Algod�n', 129.99, 3, 50),
('Chaqueta biker', 'Belstaff', 'L', 'Negro', 'Cuero', 299.99, 3, 20),
('Chaqueta varsity', 'Nike', 'M', 'Azul', 'Poli�ster', 149.99, 3, 60),
('Zapatillas de trekking', 'Salomon', '43', 'Negro', 'Sint�tico', 119.99, 4, 50),
('Zapatillas slip-on', 'Vans', '42', 'Blanco', 'Tela', 49.99, 4, 100),
('Botines Chelsea', 'Dr. Martens', '41', 'Negro', 'Cuero', 159.99, 4, 30),
('Botas de lluvia', 'Hunter', '44', 'Verde', 'Caucho', 99.99, 4, 80),
('Mocasines', 'Gucci', '43', 'Marr�n', 'Cuero', 349.99, 4, 20),
('Zapatillas de lona', 'Converse', '42', 'Rojo', 'Tela', 59.99, 4, 90),
('Sandalias deportivas', 'Teva', '41', 'Negro', 'Sint�tico', 69.99, 4, 100),
('Zapatillas de trail running', 'Asics', '44', 'Azul', 'Sint�tico', 129.99, 4, 70),
('Zapatos de vestir', 'Allen Edmonds', '43', 'Negro', 'Cuero', 299.99, 4, 50),
('Zapatillas de casa', 'UGG', '41', 'Gris', 'Lana', 79.99, 4, 60),
('Jersey con capucha', 'Carhartt', 'L', 'Verde', 'Algod�n', 59.99, 5, 70),
('Jersey de punto grueso', 'Gant', 'M', 'Marr�n', 'Lana', 99.99, 5, 60),
('Jersey cuello redondo', 'Uniqlo', 'S', 'Rojo', 'Algod�n', 39.99, 5, 100),
('Jersey con botones', 'Tommy Hilfiger', 'XL', 'Azul', 'Algod�n', 69.99, 5, 80),
('Jersey de lana merino', 'Icebreaker', 'L', 'Gris', 'Lana', 129.99, 5, 40),
('Jersey cuello barco', 'Mango', 'M', 'Beige', 'Algod�n', 49.99, 5, 90),
('Jersey oversize', 'Zara', 'L', 'Negro', 'Algod�n', 59.99, 5, 70),
('Jersey con cremallera', 'The North Face', 'M', 'Verde', 'Poli�ster', 79.99, 5, 50),
('Jersey de cuello alto', 'Massimo Dutti', 'S', 'Gris', 'Cachemira', 199.99, 5, 30),
('Jersey con coderas', 'H&M', 'XL', 'Azul', 'Algod�n', 39.99, 5, 100),
('Sudadera con capucha', 'Nike', 'L', 'Rojo', 'Poli�ster', 49.99, 6, 80),
('Sudadera con bolsillos', 'Adidas', 'M', 'Negro', 'Algod�n', 59.99, 6, 90),
('Sudadera sin mangas', 'Puma', 'S', 'Gris', 'Algod�n', 39.99, 6, 100),
('Sudadera con capucha y cremallera', 'Reebok', 'XL', 'Verde', 'Poli�ster', 69.99, 6, 60),
('Sudadera con estampado', 'Vans', 'L', 'Negro', 'Algod�n', 49.99, 6, 70),
('Sudadera con capucha oversize', 'H&M', 'M', 'Rosa', 'Algod�n', 39.99, 6, 100),
('Sudadera de felpa', 'Bershka', 'S', 'Gris', 'Algod�n', 29.99, 6, 110),
('Sudadera deportiva con capucha', 'Nike', 'XL', 'Azul', 'Poli�ster', 49.99, 6, 90),
('Sudadera con capucha casual', 'Pull&Bear', 'M', 'Blanco', 'Algod�n', 39.99, 6, 80),
('Sudadera con estampado gr�fico', 'Urban Outfitters', 'L', 'Negro', 'Algod�n', 59.99, 6, 100),
('Top sin mangas', 'H&M', 'M', 'Blanco', 'Algod�n', 19.99, 7, 100),
('Top con lentejuelas', 'Zara', 'S', 'Negro', 'Poli�ster', 29.99, 7, 80),
('Top con escote en V', 'Mango', 'L', 'Rosa', 'Algod�n', 24.99, 7, 110),
('Top de tirantes finos', 'Intimissimi', 'M', 'Blanco', 'Seda', 39.99, 7, 90),
('Top cruzado', 'Stradivarius', 'S', 'Rojo', 'Algod�n', 19.99, 7, 100),
('Top palabra de honor', 'Bershka', 'L', 'Negro', 'Poli�ster', 29.99, 7, 70),
('Top con manga abullonada', 'Pull&Bear', 'M', 'Beige', 'Algod�n', 34.99, 7, 60),
('Top ajustado', 'Uniqlo', 'S', 'Azul', 'Algod�n', 19.99, 7, 120),
('Top con nudo delantero', 'Urban Outfitters', 'M', 'Rojo', 'Algod�n', 29.99, 7, 100),
('Top con volantes', 'Zara', 'L', 'Blanco', 'Poli�ster', 24.99, 7, 90),
('Boxers de rayas', 'Calvin Klein', 'L', 'Azul', 'Algod�n', 25.99, 8, 130),
('Sujetador balconette', 'Victoria Secret', 'M', 'Rosa', 'Poli�ster', 49.99, 8, 70),
('Camiseta interior', 'Uniqlo', 'S', 'Negro', 'Algod�n', 14.99, 8, 110),
('Boxers de seda', 'Tommy Hilfiger', 'M', 'Blanco', 'Seda', 39.99, 8, 90),
('Sujetador sin aros', 'H&M', 'L', 'Rojo', 'Algod�n', 29.99, 8, 100),
('Camiseta t�rmica de lana', 'Icebreaker', 'S', 'Gris', 'Lana', 69.99, 8, 60),
('Boxers de microfibra', 'Under Armour', 'M', 'Negro', 'Poli�ster', 29.99, 8, 120),
('Sujetador de encaje', 'Intimissimi', 'L', 'Blanco', 'Encaje', 49.99, 8, 80),
('Camiseta t�rmica de compresi�n', 'Nike', 'S', 'Azul', 'Poli�ster', 34.99, 8, 100),
('Boxers de algod�n org�nico', 'Patagonia', 'M', 'Verde', 'Algod�n', 19.99, 8, 140),
('Shorts de ciclista', 'Rapha', 'L', 'Negro', 'Lycra', 99.99, 9, 40),
('Shorts de lino', 'Massimo Dutti', 'M', 'Blanco', 'Lino', 59.99, 9, 60),
('Shorts con bolsillos', 'Cargo', 'L', 'Marr�n', 'Algod�n', 39.99, 9, 110),
('Shorts deportivos', 'Nike', 'XL', 'Azul', 'Poli�ster', 29.99, 9, 120),
('Shorts de tenis', 'Adidas', 'M', 'Blanco', 'Poli�ster', 49.99, 9, 80),
('Shorts de punto', 'Zara', 'L', 'Rosa', 'Algod�n', 29.99, 9, 100),
('Shorts casuales', 'H&M', 'M', 'Beige', 'Algod�n', 19.99, 9, 90),
('Shorts de entrenamiento', 'Under Armour', 'S', 'Negro', 'Poli�ster', 39.99, 9, 130),
('Shorts para correr', 'Asics', 'L', 'Rojo', 'Poli�ster', 29.99, 9, 100),
('Shorts de playa', 'Quiksilver', 'M', 'Azul', 'Poli�ster', 49.99, 9, 120),
('Abrigo con capucha', 'Mango', 'L', 'Gris', 'Lana', 149.99, 10, 50),
('Abrigo de piel', 'Max Mara', 'M', 'Negro', 'Piel', 299.99, 10, 20),
('Abrigo de lana merino', 'Icebreaker', 'S', 'Azul', 'Lana', 199.99, 10, 60),
('Abrigo de doble faz', 'Uniqlo', 'XL', 'Beige', 'Lana', 179.99, 10, 40),
('Abrigo acolchado largo', 'The North Face', 'M', 'Negro', 'Poli�ster', 249.99, 10, 70),
('Abrigo con cintur�n', 'Massimo Dutti', 'L', 'Gris', 'Lana', 199.99, 10, 50),
('Abrigo de tweed', 'Zara', 'M', 'Marr�n', 'Lana', 149.99, 10, 60),
('Abrigo de borreguito', 'Pull&Bear', 'L', 'Beige', 'Poli�ster', 99.99, 10, 80),
('Abrigo tres cuartos', 'Mango', 'XL', 'Azul', 'Lana', 129.99, 10, 40),
('Abrigo de piel sint�tica', 'Bershka', 'M', 'Rosa', 'Poli�ster', 89.99, 10, 90),
('Chaleco de traje', 'Hugo Boss', 'M', 'Negro', 'Lana', 129.99, 11, 30),
('Chaleco de lana', 'Uniqlo', 'S', 'Gris', 'Lana', 49.99, 11, 60),
('Chaleco acolchado ligero', 'Patagonia', 'L', 'Verde', 'Poli�ster', 99.99, 11, 70),
('Chaleco de algod�n', 'Massimo Dutti', 'M', 'Azul', 'Algod�n', 59.99, 11, 40),
('Chaleco de franela', 'J.Crew', 'L', 'Rojo', 'Algod�n', 69.99, 11, 50),
('Chaleco con cremallera', 'Columbia', 'S', 'Negro', 'Poli�ster', 89.99, 11, 70),
('Chaleco de punto', 'H&M', 'M', 'Beige', 'Algod�n', 39.99, 11, 60),
('Chaleco polar', 'The North Face', 'L', 'Gris', 'Poli�ster', 119.99, 11, 40),
('Chaleco de lana merino', 'Icebreaker', 'S', 'Azul', 'Lana', 149.99, 11, 50),
('Chaleco de plumas ultraligero', 'Uniqlo', 'M', 'Negro', 'Plumas', 59.99, 11, 60),
('Conjunto de lencer�a de encaje', 'Victoria Secret', 'S', 'Negro', 'Encaje', 79.99, 12, 30),
('Conjunto de pijama de seda', 'Intimissimi', 'M', 'Rojo', 'Seda', 99.99, 12, 20),
('Conjunto de ch�ndal', 'Adidas', 'L', 'Gris', 'Poli�ster', 89.99, 12, 50),
('Conjunto de ropa interior t�rmica', 'Uniqlo', 'S', 'Negro', 'Poli�ster', 49.99, 12, 60),
('Conjunto de bikini', 'H&M', 'M', 'Rosa', 'Poli�ster', 29.99, 12, 100),
('Conjunto de blazer y pantal�n', 'Zara', 'L', 'Negro', 'Lana', 199.99, 12, 40),
('Conjunto deportivo de verano', 'Nike', 'M', 'Blanco', 'Poli�ster', 59.99, 12, 70),
('Conjunto de pijama de algod�n', 'Massimo Dutti', 'S', 'Azul', 'Algod�n', 69.99, 12, 80),
('Conjunto de ropa de trabajo', 'Carhartt', 'M', 'Marr�n', 'Algod�n', 149.99, 12, 30),
('Conjunto de traje de ba�o', 'Quiksilver', 'L', 'Negro', 'Poli�ster', 79.99, 12, 60);


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


INSERT INTO pedido (fecha, totalPedido, estado, idCliente, idEmpleado) VALUES 
('2024-06-01', 165.00, 1, 6, 6),
('2024-06-02', 198.50, 0, 7, 7),
('2024-06-03', 145.25, 1, 8, 8),
('2024-06-04', 205.75, 1, 9, 9),
('2024-06-05', 180.00, 0, 10, 10),
('2024-06-06', 190.50, 1, 11, 11),
('2024-06-07', 150.25, 1, 12, 12),
('2024-06-08', 175.00, 0, 13, 13),
('2024-06-09', 185.75, 1, 14, 14),
('2024-06-10', 220.25, 0, 15, 15),
('2024-06-11', 198.00, 1, 16, 16),
('2024-06-12', 170.50, 0, 17, 17),
('2024-06-13', 160.25, 1, 18, 18),
('2024-06-14', 185.00, 1, 19, 19),
('2024-06-15', 195.75, 0, 20, 20),
('2024-06-16', 210.25, 1, 21, 21),
('2024-06-17', 225.00, 1, 22, 22),
('2024-06-18', 245.75, 0, 23, 23),
('2024-06-19', 175.00, 1, 24, 24),
('2024-06-20', 190.50, 0, 25, 25),
('2024-06-21', 205.25, 1, 26, 26),
('2024-06-22', 220.00, 1, 27, 27),
('2024-06-23', 180.75, 0, 28, 28),
('2024-06-24', 195.50, 1, 29, 29),
('2024-06-25', 180.25, 0, 30, 30),
('2024-06-26', 170.00, 1, 31, 31),
('2024-06-27', 185.75, 0, 32, 32),
('2024-06-28', 170.25, 1, 33, 33),
('2024-06-29', 190.50, 1, 34, 34),
('2024-06-30', 210.75, 0, 35, 35),
('2024-07-01', 175.00, 1, 36, 36),
('2024-07-02', 198.50, 0, 37, 37),
('2024-07-03', 150.25, 1, 38, 38),
('2024-07-04', 215.75, 1, 39, 39),
('2024-07-05', 185.00, 0, 40, 40),
('2024-07-06', 200.50, 1, 41, 41),
('2024-07-07', 170.25, 1, 42, 42),
('2024-07-08', 195.00, 0, 43, 43),
('2024-07-09', 180.75, 1, 44, 44),
('2024-07-10', 225.25, 0, 45, 45),
('2024-07-11', 208.00, 1, 46, 46),
('2024-07-12', 160.50, 0, 47, 47),
('2024-07-13', 175.25, 1, 48, 48),
('2024-07-14', 190.00, 1, 49, 49),
('2024-07-15', 210.75, 0, 50, 50),
('2024-07-16', 215.25, 1, 51, 51),
('2024-07-17', 230.00, 1, 52, 52),
('2024-07-18', 255.75, 0, 53, 53),
('2024-07-19', 185.00, 1, 54, 54),
('2024-07-20', 195.50, 0, 55, 55),
('2024-07-21', 210.25, 1, 56, 56),
('2024-07-22', 225.00, 1, 57, 57),
('2024-07-23', 190.75, 0, 58, 58),
('2024-07-24', 205.50, 1, 59, 59),
('2024-07-25', 190.25, 0, 60, 60),
('2024-07-26', 180.00, 1, 61, 61),
('2024-07-27', 195.75, 0, 62, 62),
('2024-07-28', 185.25, 1, 63, 63),
('2024-07-29', 200.50, 1, 64, 64),
('2024-07-30', 215.75, 0, 65, 65),
('2024-07-31', 120.00, 1, 66, 66),
('2024-08-01', 135.50, 0, 67, 67),
('2024-08-02', 110.25, 1, 68, 68),
('2024-08-03', 145.75, 1, 69, 69),
('2024-08-04', 130.00, 0, 70, 70),
('2024-08-05', 140.50, 1, 71, 71),
('2024-08-06', 115.25, 1, 72, 72),
('2024-08-07', 120.00, 0, 73, 73),
('2024-08-08', 135.75, 1, 74, 74),
('2024-08-09', 150.25, 0, 75, 75),
('2024-08-10', 128.00, 1, 76, 76),
('2024-08-11', 110.50, 0, 77, 77),
('2024-08-12', 105.25, 1, 78, 78),
('2024-08-13', 115.00, 1, 79, 79),
('2024-08-14', 125.75, 0, 80, 80),
('2024-08-15', 130.25, 1, 81, 81),
('2024-08-16', 145.00, 1, 82, 82),
('2024-08-17', 155.75, 0, 83, 83),
('2024-08-18', 110.00, 1, 84, 84),
('2024-08-19', 120.50, 0, 85, 85),
('2024-08-20', 135.25, 1, 86, 86),
('2024-08-21', 140.00, 1, 87, 87),
('2024-08-22', 120.75, 0, 88, 88),
('2024-08-23', 125.50, 1, 89, 89),
('2024-08-24', 120.25, 0, 90, 90),
('2024-08-25', 115.00, 1, 91, 91),
('2024-08-26', 125.75, 0, 92, 92),
('2024-08-27', 115.25, 1, 93, 93),
('2024-08-28', 130.50, 1, 94, 94),
('2024-08-29', 140.75, 0, 95, 95),
('2024-08-30', 105.00, 1, 96, 96),
('2024-08-31', 88.50, 1, 97, 97),
('2024-09-01', 72.75, 0, 98, 98),
('2024-09-02', 95.25, 1, 99, 99),
('2024-09-03', 64.00, 1, 100, 100),
('2024-09-04', 71.50, 0, 101, 101),
('2024-09-05', 87.20, 1, 102, 102),
('2024-09-06', 59.75, 1, 103, 103),
('2024-09-07', 81.00, 0, 104, 104),
('2024-09-08', 79.25, 1, 105, 105),
('2024-09-09', 65.50, 0, 106, 106),
('2024-09-10', 84.80, 1, 107, 107),
('2024-09-11', 92.00, 0, 108, 108),
('2024-09-12', 70.25, 1, 109, 109),
('2024-09-13', 75.00, 1, 110, 110),
('2024-09-14', 83.75, 0, 111, 111),
('2024-09-15', 60.25, 1, 112, 112),
('2024-09-16', 78.50, 1, 113, 113),
('2024-09-17', 95.00, 0, 114, 114),
('2024-09-18', 63.00, 1, 115, 115),
('2024-09-19', 88.50, 0, 116, 116),
('2024-09-20', 76.25, 1, 117, 117),
('2024-09-21', 97.00, 1, 118, 118),
('2024-09-22', 68.75, 0, 119, 119),
('2024-09-23', 79.50, 1, 120, 120),
('2024-09-24', 82.25, 0, 121, 121),
('2024-09-25', 70.00, 1, 122, 122),
('2024-09-26', 85.75, 0, 123, 123),
('2024-09-27', 70.25, 1, 124, 124),
('2024-09-28', 90.50, 1, 125, 125),
('2024-09-29', 76.75, 0, 126, 126),
('2024-09-30', 96.00, 1, 127, 127), 
('2023-11-27', 88.50, 1, 115, 109),
('2023-11-26', 72.75, 0, 112, 111),
('2023-11-25', 95.25, 1, 120, 105),
('2023-11-24', 64.00, 1, 119, 113),
('2023-11-23', 71.50, 0, 104, 125),
('2023-11-22', 87.20, 1, 102, 119),
('2023-11-21', 59.75, 1, 106, 102),
('2023-11-20', 81.00, 0, 114, 121),
('2023-11-19', 79.25, 1, 110, 114),
('2023-11-18', 65.50, 0, 111, 110),
('2023-11-17', 84.80, 1, 124, 115),
('2023-11-16', 92.00, 0, 118, 120),
('2023-11-15', 70.25, 1, 123, 122),
('2023-11-14', 75.00, 1, 116, 127),
('2023-11-13', 83.75, 0, 109, 126),
('2023-11-12', 60.25, 1, 113, 123),
('2023-11-11', 78.50, 1, 101, 116),
('2023-11-10', 95.00, 0, 108, 128),
('2023-11-09', 63.00, 1, 117, 124),
('2023-11-08', 88.50, 0, 103, 107),
('2023-11-07', 76.25, 1, 122, 118),
('2023-11-06', 97.00, 1, 107, 129),
('2023-11-05', 68.75, 0, 125, 112),
('2023-11-04', 79.50, 1, 128, 108),
('2023-11-03', 82.25, 0, 126, 117),
('2023-11-02', 70.00, 1, 129, 106),
('2023-11-01', 85.75, 0, 107, 110),
('2023-10-31', 70.25, 1, 126, 118),
('2023-10-30', 90.50, 1, 121, 127),
('2023-10-29', 76.75, 0, 104, 109),
('2024-05-25', 95.00, 0, 108, 128),
('2024-05-24', 63.00, 1, 117, 124),
('2024-05-23', 88.50, 0, 103, 107),
('2024-05-22', 76.25, 1, 122, 118),
('2024-05-21', 97.00, 1, 107, 129),
('2024-05-20', 68.75, 0, 125, 112),
('2024-05-19', 79.50, 1, 128, 108),
('2024-05-18', 82.25, 0, 126, 117),
('2024-05-17', 70.00, 1, 129, 106),
('2024-05-16', 85.75, 0, 107, 110),
('2024-05-15', 70.25, 1, 126, 118),
('2024-05-14', 90.50, 1, 121, 127),
('2024-05-13', 76.75, 0, 104, 109),
('2024-05-12', 79.25, 1, 110, 114),
('2024-05-11', 65.50, 0, 111, 110),
('2024-05-10', 84.80, 1, 124, 115),
('2024-05-09', 92.00, 0, 118, 120),
('2024-05-08', 70.25, 1, 123, 122),
('2024-05-07', 75.00, 1, 116, 127),
('2024-05-06', 83.75, 0, 109, 126),
('2024-05-05', 60.25, 1, 113, 123),
('2024-05-04', 78.50, 1, 101, 116),
('2024-05-03', 95.00, 0, 108, 128),
('2024-05-02', 63.00, 1, 117, 124),
('2024-05-01', 88.50, 0, 103, 107),
('2024-04-30', 76.25, 1, 122, 118),
('2024-04-29', 97.00, 1, 107, 129),
('2024-04-28', 68.75, 0, 125, 112),
('2024-04-27', 79.50, 1, 128, 108),
('2024-04-26', 82.25, 0, 126, 117),
('2024-04-25', 70.00, 1, 115, 132),
('2024-04-24', 85.75, 0, 112, 133),
('2024-04-23', 70.25, 1, 120, 134),
('2024-04-22', 90.50, 1, 119, 135),
('2024-04-21', 76.75, 0, 104, 136),
('2024-04-20', 79.25, 1, 102, 137),
('2024-04-19', 65.50, 0, 106, 138),
('2024-04-18', 84.80, 1, 114, 139),
('2024-04-17', 92.00, 0, 110, 140),
('2024-04-16', 70.25, 1, 104, 141),
('2024-04-15', 75.00, 1, 124, 142),
('2024-04-14', 83.75, 0, 118, 143),
('2024-04-13', 60.25, 1, 123, 144),
('2024-04-12', 78.50, 1, 116, 145),
('2024-04-11', 95.00, 0, 109, 146),
('2024-04-10', 63.00, 1, 113, 147),
('2024-04-09', 88.50, 0, 101, 148),
('2024-04-08', 76.25, 1, 121, 149),
('2024-04-07', 97.00, 1, 128, 150),
('2024-04-06', 68.75, 0, 126, 151),
('2024-04-05', 79.50, 1, 129, 152),
('2024-04-04', 82.25, 0, 107, 153),
('2024-04-03', 70.00, 1, 126, 154),
('2024-04-02', 85.75, 0, 121, 155),
('2024-04-01', 70.25, 1, 124, 156),
('2024-03-31', 90.50, 1, 128, 157),
('2024-03-30', 76.75, 0, 110, 158),
('2024-03-29', 79.25, 1, 115, 159),
('2024-03-28', 65.50, 0, 112, 160);


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


INSERT INTO pedidoProducto (cantidad, idPedido, idProducto) VALUES
(2, 184, 2),
(3, 185, 4),
(1, 186, 6),
(4, 187, 8),
(2, 188, 10),
(3, 189, 12),
(1, 190, 14),
(4, 191, 15),
(2, 192, 1),
(3, 193, 3),
(1, 194, 5),
(4, 195, 7),
(2, 196, 9),
(3, 197, 11),
(1, 198, 13),
(4, 199, 15),
(2, 200, 2),
(3, 201, 4),
(1, 202, 6),
(4, 203, 8),
(2, 204, 10),
(3, 205, 12),
(1, 206, 14),
(4, 207, 15),
(2, 208, 1),
(3, 209, 3),
(1, 210, 5),
(4, 211, 7),
(2, 136, 2),
(3, 137, 4),
(1, 138, 6),
(4, 139, 8),
(2, 140, 10),
(3, 141, 12),
(1, 142, 14),
(4, 143, 15),
(2, 144, 1),
(3, 145, 3),
(1, 146, 5),
(4, 147, 7),
(2, 148, 9),
(3, 149, 11),
(1, 150, 13),
(4, 151, 15),
(2, 152, 2),
(3, 153, 4),
(1, 154, 6),
(4, 155, 8),
(2, 156, 10),
(3, 157, 12),
(1, 158, 14),
(4, 159, 15),
(2, 160, 1),
(3, 161, 3),
(1, 162, 5),
(4, 163, 7),
(2, 164, 9),
(3, 165, 11),
(1, 166, 13),
(4, 167, 15),
(2, 168, 2),
(3, 169, 4),
(1, 170, 6),
(4, 171, 8),
(2, 172, 10),
(3, 173, 12),
(1, 174, 14),
(4, 175, 15),
(2, 176, 1),
(3, 177, 3),
(1, 178, 5),
(4, 179, 7),
(2, 180, 9),
(3, 181, 11),
(1, 182, 13),
(4, 183, 15),
(2, 96, 1),
(3, 97, 3),
(1, 98, 5),
(4, 99, 7),
(2, 100, 9),
(3, 101, 11),
(1, 102, 13),
(4, 103, 15),
(2, 104, 2),
(3, 105, 4),
(1, 106, 6),
(4, 107, 8),
(2, 108, 10),
(3, 109, 12),
(1, 110, 14),
(4, 111, 15),
(2, 112, 1),
(3, 113, 3),
(1, 114, 5),
(4, 115, 7),
(2, 116, 9),
(3, 117, 11),
(1, 118, 13),
(4, 119, 15),
(2, 120, 2),
(3, 121, 4),
(1, 122, 6),
(4, 123, 8),
(2, 124, 10),
(3, 125, 12),
(1, 126, 14),
(4, 127, 15),
(2, 128, 1),
(3, 129, 3),
(1, 130, 5),
(4, 131, 7),
(2, 132, 9),
(3, 133, 11),
(1, 134, 13),
(4, 135, 15),
(2, 66, 5),
(3, 67, 7),
(1, 68, 9),
(4, 69, 11),
(2, 70, 13),
(3, 71, 15),
(1, 72, 1),
(4, 73, 3),
(2, 74, 5),
(3, 75, 7),
(1, 76, 9),
(4, 77, 11),
(2, 78, 13),
(3, 79, 15),
(1, 80, 2),
(4, 81, 4),
(2, 82, 6),
(3, 83, 8),
(1, 84, 10),
(4, 85, 12),
(2, 86, 14),
(3, 87, 15),
(1, 88, 1),
(4, 89, 3),
(2, 90, 5),
(3, 91, 7),
(1, 92, 9),
(4, 93, 11),
(2, 94, 13),
(3, 95, 15),
(2, 36, 6),
(3, 37, 13),
(1, 38, 1),
(4, 39, 11),
(2, 40, 8),
(3, 41, 10),
(1, 42, 12),
(4, 43, 7),
(2, 44, 2),
(3, 45, 14),
(1, 46, 4),
(4, 47, 9),
(2, 48, 3),
(3, 49, 15),
(1, 50, 5),
(4, 51, 8),
(2, 52, 10),
(3, 53, 12),
(1, 54, 1),
(4, 55, 11),
(2, 56, 6),
(3, 57, 13),
(1, 58, 2),
(4, 59, 14),
(2, 60, 7),
(3, 61, 9),
(1, 62, 3),
(4, 63, 15),
(2, 64, 4),
(3, 65, 8),
(2, 6, 10),
(3, 7, 2),
(1, 8, 14),
(4, 9, 6),
(2, 10, 9),
(3, 11, 1),
(1, 12, 13),
(4, 13, 4),
(2, 14, 11),
(3, 15, 3),
(1, 16, 15),
(4, 17, 5),
(2, 18, 8),
(3, 19, 10),
(1, 20, 12),
(4, 21, 7),
(2, 22, 2),
(3, 23, 14),
(1, 24, 6),
(4, 25, 9),
(2, 26, 1),
(3, 27, 13),
(1, 28, 4),
(4, 29, 11),
(2, 30, 3),
(3, 31, 15),
(1, 32, 5),
(4, 33, 8),
(2, 34, 10),
(3, 35, 12),
(2, 1, 5),
(3, 2, 8),
(1, 3, 12),
(4, 4, 3),
(2, 5, 7);