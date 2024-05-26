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
('Antonio Lopez Gonzalez', 1, 'Avenida de la Constitución 14, Sevilla', '622556677', '1979-02-18'),
('Laura Fernandez Martin', 0, 'Calle Mayor 6, Zaragoza', '633778899', '1986-12-12'),
('Josefa Morales Alvarez', 0, 'Calle Serrano 19, Madrid', '644112233', '1995-11-11'),
('Miguel Rodriguez Jimenez', 1, 'Avenida de América 2, Madrid', '655445566', '1983-07-21'),
('Lucia Garcia Castillo', 0, 'Paseo de la Castellana 10, Madrid', '611556677', '1990-04-14'),
('Francisco Sanchez Gil', 1, 'Calle de Alcalá 100, Madrid', '622778899', '1981-03-03'),
('Pilar Vargas Ruiz', 0, 'Calle Gran Capitán 3, Granada', '633112233', '1993-09-19'),
('Alberto Martin Diaz', 1, 'Avenida de los Pinos 17, Murcia', '644334455', '1987-08-05'),
('Sofia Lopez Torres', 0, 'Plaza del Pilar 1, Zaragoza', '655667788', '1994-01-01'),
('Enrique Gomez Martinez', 1, 'Calle Velázquez 5, Madrid', '611778899', '1985-05-05'),
('Raquel Diaz Romero', 0, 'Calle Laraña 12, Sevilla', '622112233', '1991-06-06'),
('Rafael Ortega Hernandez', 1, 'Avenida Blasco Ibáñez 15, Valencia', '633445566', '1982-07-07'),
('Isabel Gil Perez', 0, 'Calle Larios 15, Málaga', '644556677', '1996-02-22'),
('Javier Herrera Ramos', 1, 'Avenida del Cid 32, Valencia', '655778899', '1989-10-10'),
('Natalia Gonzalez Suarez', 0, 'Calle de la Princesa 4, Madrid', '611889900', '1993-11-11'),
('Adrian Alvarez Castro', 1, 'Avenida de Galicia 9, Oviedo', '622334455', '1986-12-12'),
('Marta Castillo Navarro', 0, 'Calle Uría 25, Oviedo', '633556677', '1991-09-09'),
('Sergio Morales Vega', 1, 'Calle Recogidas 22, Granada', '644112233', '1984-08-18'),
('Teresa Marquez Jimenez', 0, 'Calle Toledo 8, Madrid', '655334455', '1995-03-03'),
('Andres Soto Ramirez', 1, 'Calle Alfonso XII 13, Sevilla', '611223344', '1980-04-14'),
('Elena Rubio Sanchez', 0, 'Paseo de San Francisco 11, Bilbao', '622556677', '1992-05-15'),
('Vicente Iglesias Garcia', 1, 'Calle Cuchilleros 2, Salamanca', '633778899', '1975-06-16'),
('Paula Molina Gonzalez', 0, 'Calle Feria 6, Sevilla', '644112233', '1985-07-17'),
('Rodrigo Ruiz Fernandez', 1, 'Calle Tetuán 5, Sevilla', '655223344', '1990-08-18'),
('Monica Fernandez Ruiz', 0, 'Calle Sierpes 9, Sevilla', '611445566', '1988-09-19'),
('Fernando Delgado Morales', 1, 'Calle Larios 7, Málaga', '622667788', '1979-10-20'),
('Patricia Dominguez Martin', 0, 'Calle Granada 10, Málaga', '633889900', '1986-11-21'),
('Gabriel Vargas Torres', 1, 'Calle Marqués de Larios 14, Málaga', '644334455', '1992-12-22'),
('Rocio Blanco Jimenez', 0, 'Calle Real 16, Cádiz', '655445566', '1983-01-23'),
('David Suarez Garcia', 1, 'Calle Ancha 18, Cádiz', '611556677', '1990-02-24'),
('Sandra Martinez Lopez', 0, 'Calle Mayor 20, Murcia', '622778899', '1984-03-25'),
('Alvaro Hernandez Ramos', 1, 'Calle San Miguel 22, Palma de Mallorca', '633112233', '1991-04-26'),
('Cristina Perez Gil', 0, 'Avenida Gabriel Roca 30, Palma de Mallorca', '644556677', '1989-05-27'),
('Daniel Lopez Sanchez', 1, 'Calle Jaime III 34, Palma de Mallorca', '655889900', '1987-06-28'),
('Natalia Hernandez Garcia', 0, 'Calle del Mar 3, Alicante', '611112233', '1992-07-29'),
('Manuel Gil Perez', 1, 'Calle San Vicente 5, Valencia', '622334455', '1981-08-30'),
('Isabel Jimenez Ruiz', 0, 'Calle Serrano 7, Madrid', '633556677', '1985-09-01'),
('Jose Torres Hernandez', 1, 'Calle Preciados 12, Madrid', '644778899', '1994-10-02'),
('Silvia Ruiz Gonzalez', 0, 'Paseo de la Castellana 50, Madrid', '655112233', '1987-11-03'),
('Mario Martinez Vazquez', 1, 'Calle Gran Vía 22, Madrid', '611334455', '1983-12-04'),
('Elena Romero Sanchez', 0, 'Calle de Alcalá 15, Madrid', '622556677', '1990-01-05'),
('Julio Ortiz Fernandez', 1, 'Calle Mayor 8, Zaragoza', '633778899', '1988-02-06'),
('Alicia Gutierrez Lopez', 0, 'Calle Alfonso I 9, Zaragoza', '644112233', '1993-03-07'),
('Pedro Fernandez Gomez', 1, 'Calle Mayor 3, Madrid', '611223344', '1984-09-15'),
('Marina Sanchez Torres', 0, 'Avenida de América 10, Barcelona', '622445566', '1993-07-23'),
('Ismael Ruiz Fernandez', 1, 'Calle Gran Vía 15, Madrid', '633667788', '1980-04-01'),
('Sara Martínez García', 0, 'Paseo de la Castellana 20, Madrid', '644889900', '1990-12-07'),
('Jorge López Martínez', 1, 'Calle Alcalá 50, Madrid', '655112233', '1986-05-11'),
('Celia González López', 0, 'Calle Goya 7, Madrid', '611334455', '1987-08-30'),
('Marcos Pérez Rodríguez', 1, 'Calle Serrano 25, Madrid', '622556677', '1995-03-05'),
('Lucía Martín Fernández', 0, 'Avenida de la Constitución 30, Sevilla', '633778899', '1982-10-19'),
('Diego Gómez Sánchez', 1, 'Calle del Carmen 40, Valencia', '644112233', '1991-11-25'),
('Elena Rodríguez Jiménez', 0, 'Calle Alfonso I 15, Zaragoza', '655445566', '1988-02-15'),
('Pablo Sánchez Martínez', 1, 'Calle Mayor 5, Salamanca', '611556677', '1994-06-30'),
('Laura Pérez Gómez', 0, 'Plaza Mayor 8, Málaga', '622778899', '1983-03-02'),
('Ángela Martínez López', 0, 'Calle Larios 10, Málaga', '633112233', '1996-09-14'),
('Daniel Rodríguez Sánchez', 1, 'Calle Alcalde Ángel 15, Murcia', '644556677', '1987-12-22'),
('Natalia Pérez García', 0, 'Avenida de la Libertad 18, Granada', '655889900', '1992-04-10'),
('Alejandro Gómez Martínez', 1, 'Calle Alcalá 35, Madrid', '611112233', '1989-01-20'),
('Andrea Martín Sánchez', 0, 'Calle Tetuán 20, Madrid', '622334455', '1993-08-05'),
('Hugo Pérez Martínez', 1, 'Calle Mayor 25, Madrid', '633556677', '1984-07-18'),
('Clara González Rodríguez', 0, 'Calle Alcalde Juan 5, Madrid', '644778899', '1990-02-03'),
('David Fernández Pérez', 1, 'Calle Mayor 10, Madrid', '655112233', '1985-06-12'),
('María López García', 0, 'Calle Gran Vía 20, Madrid', '611334455', '1997-10-08'),
('Marcos Martínez Rodríguez', 1, 'Paseo de la Castellana 15, Madrid', '622556677', '1982-09-21'),
('Sofía Gómez Martín', 0, 'Calle Alcalá 30, Madrid', '633778899', '1994-05-16'),
('Lucas Sánchez Pérez', 1, 'Calle Mayor 8, Madrid', '644112233', '1981-08-29'),
('Paula Martínez González', 0, 'Calle Gran Vía 5, Madrid', '655445566', '1995-12-17'),
('Mateo Pérez López', 1, 'Calle Serrano 20, Madrid', '611556677', '1988-03-25'),
('Valeria González Martínez', 0, 'Calle Mayor 12, Madrid', '622778899', '1993-11-04'),
('Santiago Rodríguez Fernández', 1, 'Calle Alcalá 25, Madrid', '633112233', '1986-04-14'),
('Emma López Pérez', 0, 'Calle Gran Vía 35, Madrid', '644556677', '1990-09-09'),
('Abril Martínez Gómez', 1, 'Calle Mayor 15, Madrid', '655889900', '1983-02-21'),
('Oliver Pérez Rodríguez', 1, 'Calle Serrano 10, Madrid', '611112233', '1992-07-06'),
('Leire González Sánchez', 0, 'Paseo de la Castellana 18, Madrid', '622334455', '1987-12-29'),
('Maximiliano Martín Martínez', 1, 'Calle Gran Vía 10, Madrid', '633556677', '1994-06-03'),
('Carmen Sánchez González', 0, 'Calle Mayor 22, Madrid', '644778899', '1981-11-11'),
('Sergio Rodríguez Martín', 1, 'Calle Alcalá 40, Madrid', '655112233', '1996-03-16'),
('Aurora Martínez Sánchez', 0, 'Calle Mayor 18, Madrid', '611334455', '1985-08-22'),
('Noah Pérez González', 1, 'Calle Mayor 12, Madrid', '622556677', '1990-12-03'),
('Julia Gómez Martínez', 0, 'Calle Mayor 8, Madrid', '633778899', '1983-09-14'),
('Iker López Pérez', 1, 'Calle Serrano 15, Madrid', '644112233', '1995-02-25'),
('Valentina Martínez Rodríguez', 0, 'Paseo de la Castellana 28, Madrid', '655445566', '1988-05-05'),
('Leonardo Pérez López', 1, 'Calle Alcalá 20, Madrid', '611556677', '1993-10-07'),
('Camila González Fernández', 0, 'Calle Mayor 5, Madrid', '622778899', '1986-11-18'),
('Luciano Martín Gómez', 1, 'Calle Gran Vía 18, Madrid', '633112233', '1991-04-23'),
('Alba Sánchez Martínez', 0, 'Calle Mayor 11, Madrid', '644556677', '1984-07-08'),
('Íker Rodríguez Sánchez', 1, 'Calle Serrano 17, Madrid', '655889900', '1997-01-12'),
('Emma Martínez Pérez', 0, 'Calle Gran Vía 40, Madrid', '611112233', '1982-08-29'),
('Olivia Pérez González', 0, 'Calle Mayor 13, Madrid', '622334455', '1994-06-17'),
('Joel González Martínez', 1, 'Calle Serrano 30, Madrid', '633556677', '1981-03-04'),
('Alma Martín Rodríguez', 0, 'Calle Mayor 33, Madrid', '644778899', '1990-09-20'),
('Matías Sánchez López', 1, 'Calle Alcalá 45, Madrid', '655112233', '1983-12-31'),
('Eva Rodríguez Fernández', 0, 'Calle Gran Vía 38, Madrid', '611334455', '1992-07-24'),
('Gael Pérez Martínez', 1, 'Calle Serrano 22, Madrid', '622556677', '1987-10-16'),
('Luna Martínez Sánchez', 0, 'Calle Mayor 19, Madrid', '633778899', '1996-05-28'),
('Facundo González López', 1, 'Calle Alcalá 60, Madrid', '644112233', '1989-11-11'),
('Valeria Gómez Rodríguez', 0, 'Calle Gran Vía 50, Madrid', '655445566', '1995-08-03'),
('Benjamín Pérez Martín', 1, 'Calle Serrano 5, Madrid', '611556677', '1982-01-15'),
('Carla Martínez González', 0, 'Calle Mayor 21, Madrid', '622778899', '1990-04-09'),
('Aaron Sánchez Rodríguez', 1, 'Calle Alcalá 35, Madrid', '633112233', '1985-09-27'),
('Lola Rodríguez Martínez', 0, 'Calle Gran Vía 45, Madrid', '644556677', '1992-02-18'),
('Bruno Martín Sánchez', 1, 'Calle Serrano 40, Madrid', '655889900', '1987-03-11'),
('Julieta López Pérez', 0, 'Calle Mayor 25, Madrid', '611112233', '1994-06-05'),
('Lucas Pérez González', 1, 'Calle Gran Vía 20, Madrid', '622334455', '1981-12-20'),
('Victoria González Martínez', 0, 'Calle Alcalá 55, Madrid', '633556677', '1993-07-14'),
('Benicio Martínez López', 1, 'Calle Mayor 28, Madrid', '644778899', '1984-05-02'),
('Aitana Sánchez Pérez', 0, 'Calle Gran Vía 48, Madrid', '655112233', '1990-08-06'),
('Lorenzo Rodríguez González', 1, 'Calle Serrano 18, Madrid', '611334455', '1983-11-27'),
('Valentino Martín Martínez', 0, 'Calle Mayor 31, Madrid', '622556677', '1995-04-23'),
('Gabriela Pérez Rodríguez', 1, 'Calle Alcalá 38, Madrid', '633778899', '1988-09-19'),
('Martina González Sánchez', 0, 'Calle Gran Vía 32, Madrid', '644112233', '1991-01-14'),
('Hugo Martínez López', 1, 'Calle Mayor 38, Barcelona', '655445566', '1980-06-17'),
('Ainhoa Rodríguez Martínez', 0, 'Calle Gran Vía 17, Barcelona', '611223344', '1992-11-23'),
('Dylan García Fernández', 1, 'Calle Rambla 45, Barcelona', '622778899', '1984-08-30'),
('Lía Pérez Sánchez', 0, 'Calle Mayor 25, Barcelona', '633556677', '1995-03-10'),
('Ian Martínez Rodríguez', 1, 'Avenida Diagonal 20, Barcelona', '644334455', '1983-07-01'),
('Maia González López', 0, 'Calle Provença 10, Barcelona', '655667788', '1991-04-15'),
('Axel Rodríguez Pérez', 1, 'Calle Passeig de Gràcia 30, Barcelona', '611889900', '1988-12-04'),
('Irene Martín Martínez', 0, 'Carrer del Bisbe 5, Barcelona', '622112233', '1993-05-20'),
('Biel Pérez Sánchez', 1, 'Carrer de la Lluna 15, Barcelona', '633445566', '1987-09-09'),
('Ayla González Rodríguez', 0, 'Carrer de la Barceloneta 20, Barcelona', '644778899', '1994-01-14'),
('Santiago Martínez López', 1, 'Calle General Weyler 2, Sevilla', '655112233', '1982-08-17'),
('Manuela Pérez García', 0, 'Avenida de la Constitución 40, Sevilla', '611223344', '1995-03-26'),
('Diego Rodríguez Martínez', 1, 'Calle Tetuán 5, Sevilla', '622445566', '1989-11-08'),
('Laura García Sánchez', 0, 'Calle Alfonso XII 15, Sevilla', '633667788', '1984-07-02'),
('Miguel Martínez Rodríguez', 1, 'Calle Mateos Gago 10, Sevilla', '644889900', '1992-05-19'),
('Elena Pérez López', 0, 'Calle San Fernando 8, Sevilla', '655112233', '1981-10-12'),
('María Rodríguez Martín', 0, 'Calle Santa María la Blanca 25, Toledo', '611334455', '1994-09-30'),
('Adrián Martínez Sánchez', 1, 'Calle Real del Arrabal 20, Toledo', '622556677', '1983-04-23'),
('Sara López Rodríguez', 0, 'Calle de la Plata 15, Toledo', '633778899', '1991-12-06'),
('Pablo Sánchez Martínez', 1, 'Calle de la Ronda 30, Toledo', '644112233', '1986-08-09'),
('Carolina Pérez García', 0, 'Calle de la Merced 12, Toledo', '655445566', '1993-01-22'),
('Javier Martín López', 1, 'Calle del Comercio 18, Valencia', '611556677', '1980-04-15'),
('Aitana Rodríguez Martínez', 0, 'Calle de la Paz 20, Valencia', '622778899', '1992-10-28'),
('Hugo Martínez Pérez', 1, 'Calle de la Reina 8, Valencia', '633112233', '1987-06-03'),
('Lucía Pérez García', 0, 'Calle de la Estrella 5, Valencia', '644556677', '1990-02-17'),
('David Rodríguez Martín', 1, 'Calle de la Cruz 25, Valencia', '655889900', '1984-11-28'),
('Elena Martínez López', 0, 'Calle de las Avellanas 30, Valencia', '611112233', '1997-07-09'),
('Sergio Pérez Rodríguez', 1, 'Calle de la Linterna 15, Valencia', '622334455', '1982-03-13'),
('Isabella García Martínez', 0, 'Calle del Mercado 12, Valencia', '633556677', '1995-09-05'),
('Martín Rodríguez Pérez', 1, 'Calle de la Paz 8, Bilbao', '644778899', '1983-12-20'),
('Aurora Martínez García', 0, 'Calle de la Esperanza 6, Bilbao', '655112233', '1990-07-15'),
('Adriana Pérez Martín', 0, 'Calle del Arenal 14, Bilbao', '611334455', '1985-04-28'),
('Héctor González López', 1, 'Calle de la Ribera 10, Bilbao', '622556677', '1992-01-31'),
('Carmen Rodríguez Sánchez', 0, 'Calle de la Alhóndiga 5, Bilbao', '633778899', '1981-08-14'),
('Maximiliano Martínez Rodríguez', 1, 'Calle del Ensanche 20, Bilbao', '644112233', '1996-05-27'),
('Marta García Martín', 0, 'Calle de San Francisco 8, Bilbao', '655445566', '1984-10-09'),
('Bruno Pérez López', 1, 'Calle de la Gran Vía 15, Bilbao', '611556677', '1991-03-22'),
('Clara Martínez Rodríguez', 0, 'Calle de la Plaza Nueva 25, Bilbao', '622334455', '1987-09-16'),
('Gabriel Rodríguez Martín', 1, 'Calle de la Victoria 30, Bilbao', '633556677', '1994-12-08'),
('Elena López Pérez', 0, 'Calle de la Diputación 18, Bilbao', '644778899', '1983-07-21'),
('Alejandro Pérez Martínez', 1, 'Calle Mayor 10, Valencia', '622112233', '1990-12-03'),
('Isabel Gómez Rodríguez', 0, 'Calle Real 20, Valencia', '633778899', '1983-09-14'),
('Carlos López Pérez', 1, 'Calle de la Palma 15, Valencia', '644445566', '1995-02-25'),
('Paula Martínez Fernández', 0, 'Plaza Mayor 28, Valencia', '655556677', '1988-05-05'),
('Adrián Pérez López', 1, 'Avenida de las Flores 20, Valencia', '611223344', '1993-10-07'),
('Natalia González García', 0, 'Calle de San Vicente 35, Valencia', '622334455', '1986-11-18'),
('Samuel Martín Rodríguez', 1, 'Calle del Carmen 10, Valencia', '633667788', '1991-04-23'),
('Julia Sánchez Martínez', 0, 'Calle de las Rosas 15, Valencia', '644889900', '1984-07-08'),
('Diego Rodríguez López', 1, 'Avenida del Puerto 18, Valencia', '655112233', '1997-01-12'),
('Martina Martínez Pérez', 0, 'Calle de San José 25, Valencia', '611778899', '1982-08-29'),
('Alonso Pérez González', 1, 'Calle del Mar 30, Valencia', '622556677', '1994-06-17'),
('Emma Rodríguez Martín', 0, 'Calle del Pilar 40, Valencia', '633334455', '1981-03-04'),
('Ainhoa Martínez Sánchez', 0, 'Calle de la Paz 35, Valencia', '644556677', '1990-09-20'),
('Jorge Rodríguez Rodríguez', 1, 'Calle de las Palmas 50, Valencia', '655889900', '1993-12-31'),
('Valeria López Fernández', 0, 'Avenida de las Delicias 38, Valencia', '611112233', '1982-07-24'),
('Lucas González González', 1, 'Calle de Xàtiva 22, Valencia', '622334455', '1987-10-16'),
('Marta Martín Martínez', 0, 'Calle de las Comedias 19, Valencia', '633556677', '1996-05-28'),
('Pablo Sánchez Pérez', 1, 'Calle de Colón 60, Valencia', '644112233', '1989-11-11'),
('Laura Rodríguez Fernández', 0, 'Calle del Palau 50, Valencia', '655445566', '1995-08-03'),
('Alejandro Pérez López', 1, 'Calle de las Animas 5, Valencia', '611223344', '1982-01-15'),
('Sara Martínez Rodríguez', 0, 'Calle de la Albufera 35, Valencia', '622778899', '1990-04-09'),
('Mario González Pérez', 1, 'Calle del Marqués de Sotelo 12, Valencia', '633112233', '1985-09-27'),
('Aitana Rodríguez Fernández', 0, 'Calle de la Reina 25, Valencia', '644556677', '1992-02-18'),
('Carlos Martín Martínez', 1, 'Calle del General Urrutia 18, Valencia', '655889900', '1987-03-11'),
('Carmen Pérez Sánchez', 0, 'Calle de San Vicente Mártir 22, Valencia', '611112233', '1994-06-05'),
('Miguel González González', 1, 'Calle de la Paz 15, Valencia', '622334455', '1981-12-20'),
('Natalia Martínez Rodríguez', 0, 'Calle de la Sangre 30, Valencia', '633778899', '1993-07-14'),
('Lucía Pérez Martínez', 1, 'Calle de los Derechos 28, Valencia', '644778899', '1984-05-02'),
('Javier González López', 0, 'Calle de San Francisco 8, Valencia', '655112233', '1990-08-06'),
('Carla Rodríguez Rodríguez', 1, 'Calle del Doctor Zamenhof 15, Valencia', '611334455', '1983-11-27'),
('Santiago Martínez Pérez', 0, 'Calle de la Paz 8, Sevilla', '622556677', '1995-04-23'),
('Laura Pérez González', 1, 'Calle del Aire 38, Sevilla', '633778899', '1988-09-19'),
('Lucas Rodríguez Martínez', 0, 'Calle de la Reja 32, Sevilla', '644112233', '1991-01-14'),
('Alicia González Sánchez', 1, 'Calle del Arquillo 5, Sevilla', '655445566', '1980-06-17'),
('Marcos Pérez Martínez', 1, 'Calle Mayor 10, Barcelona', '622112233', '1990-12-03'),
('Sofía Gómez Rodríguez', 0, 'Avenida Diagonal 20, Barcelona', '633778899', '1983-09-14'),
('Hugo López Pérez', 1, 'Calle del Pilar 15, Barcelona', '644445566', '1995-02-25'),
('Valentina Martínez Fernández', 0, 'Calle de Provenza 28, Barcelona', '655556677', '1988-05-05'),
('Lucía Pérez López', 0, 'Calle de la Rambla 20, Barcelona', '611223344', '1993-10-07'),
('Javier González García', 1, 'Passeig de Gràcia 35, Barcelona', '622334455', '1986-11-18'),
('Marina Martín Rodríguez', 0, 'Carrer de Mallorca 10, Barcelona', '633667788', '1991-04-23'),
('Mateo Sánchez Martínez', 1, 'Carrer de Muntaner 15, Barcelona', '644889900', '1984-07-08'),
('Nora Rodríguez López', 0, 'Carrer de Balmes 18, Barcelona', '655112233', '1997-01-12'),
('Leo Martínez Pérez', 1, 'Carrer de Valencia 25, Barcelona', '611778899', '1982-08-29'),
('Abril Pérez González', 0, 'Carrer de Provença 30, Barcelona', '622556677', '1994-06-17'),
('Héctor García Pérez', 1, 'Calle de la Reina Mercedes 12, Vizcaya', '633889900', '1990-08-16'),
('Eva Martínez Rodríguez', 0, 'Calle de San Sebastián 5, Zaragoza', '644223344', '1983-11-21'),
('Marta Rodríguez Sánchez', 0, 'Avenida de la Palmera 20, Sevilla', '655556677', '1996-04-05'),
('Diego González Martínez', 1, 'Calle del Postigo 15, Alicante', '611334455', '1981-07-13'),
('Sara Martínez López', 0, 'Calle de la Malagueta 25, Málaga', '622667788', '1994-10-28'),
('Pablo Pérez Rodríguez', 1, 'Calle de los Geranios 30, Murcia', '633445566', '1987-02-04'),
('Lucía García Martínez', 0, 'Calle del Orzán 8, A Coruña', '644778899', '1992-05-17'),
('Daniel López Rodríguez', 1, 'Calle del Rincón 10, Vizcaya', '655112233', '1985-12-03'),
('Alba Martínez Sánchez', 0, 'Calle del Acuario 15, Zaragoza', '611889900', '1993-09-09'),
('Alejandro Pérez Martínez', 1, 'Calle de Luis Montoto 18, Sevilla', '633112233', '1980-06-25'),
('Laura Gómez Rodríguez', 0, 'Calle de las Lomas 25, Alicante', '644334455', '1991-03-10'),
('Carlos López Pérez', 1, 'Avenida de Blas Infante 20, Málaga', '655667788', '1984-08-18'),
('Sofía Martínez López', 0, 'Calle del Carmen 30, Murcia', '611223344', '1995-01-27'),
('Javier González Rodríguez', 1, 'Calle de la Marina 8, A Coruña', '622556677', '1983-04-14'),
('Elena Rodríguez Martínez', 0, 'Calle de los Mártires 15, Vizcaya', '633778899', '1990-07-02'),
('Diego Martínez Pérez', 1, 'Calle del Tempranillo 10, Zaragoza', '644556677', '1986-02-16'),
('Lucía Pérez López', 0, 'Calle de Gamazo 25, Sevilla', '655889900', '1991-09-22'),
('Alejandro Rodríguez García', 1, 'Calle de la Explanada 12, Alicante', '611112233', '1982-12-07'),
('María López Martínez', 0, 'Calle de la Alameda 20, Málaga', '622334455', '1997-11-04'),
('Iván Pérez Rodríguez', 1, 'Calle de la Gloria 28, Murcia', '633556677', '1984-05-31'),
('Sara Martínez Sánchez', 0, 'Calle de Santa Cristina 15, A Coruña', '644778899', '1992-08-14'),
('Carlos García Pérez', 1, 'Calle de Gregorio Marañón 10, Vizcaya', '655112233', '1983-01-29'),
('Lucía López Rodríguez', 0, 'Calle de las Delicias 30, Zaragoza', '611334455', '1996-06-07'),
('Daniel Martínez López', 1, 'Calle de San Fernando 18, Sevilla', '622667788', '1981-03-03'),
('Sergio Rodríguez Sánchez', 1, 'Calle del Conde de Rodezno 15, Logroño', '633445566', '1994-05-12'),
('Marina López Martínez', 0, 'Plaza del Castillo 20, Pamplona', '644889900', '1987-08-21'),
('Lucas Pérez Rodríguez', 1, 'Calle de la Estafeta 30, Pamplona', '655112233', '1990-02-14'),
('Aitana Martínez López', 0, 'Calle de las Bardenas Reales 35, Tudela', '611778899', '1983-11-07'),
('Pablo González Pérez', 1, 'Calle de San Nicolás 25, Tudela', '622556677', '1996-06-24'),
('Elena Rodríguez Martín', 0, 'Calle de las Tejeras 40, Logroño', '633778899', '1981-09-17'),
('Hugo Martínez Rodríguez', 1, 'Avenida de la Paz 28, Logroño', '644445566', '1993-04-03'),
('Julia Pérez López', 0, 'Calle de San Juan 18, Logroño', '655667788', '1986-01-29'),
('Adrián García Martínez', 1, 'Calle de la Alberca 12, Logroño', '611334455', '1991-08-12'),
('Sara López Rodríguez', 0, 'Calle del Espolón 15, Burgos', '622112233', '1984-03-25'),
('Iván Martínez Pérez', 1, 'Calle de la Merced 20, Burgos', '633667788', '1997-10-09'),
('María García López', 0, 'Calle de San Lesmes 25, Burgos', '644778899', '1982-07-14'),
('Alejandro Pérez Martín', 1, 'Calle de Fernán González 30, Burgos', '655889900', '1995-12-28'),
('Lucía Martín Sánchez', 0, 'Plaza Mayor 8, Salamanca', '611112233', '1983-05-01'),
('David Rodríguez López', 1, 'Calle de la Rúa Mayor 10, Salamanca', '622334455', '1990-10-16'),
('Carla López Martínez', 0, 'Calle de Toro 15, Salamanca', '633556677', '1985-04-30'),
('Javier González Pérez', 1, 'Calle de la Compañía 20, Salamanca', '644112233', '1992-09-15'),
('Marta Rodríguez Martín', 0, 'Calle de San Pablo 25, Salamanca', '655445566', '1981-06-11'),
('Diego Martínez Sánchez', 1, 'Calle del Prior 30, León', '611223344', '1994-11-26'),
('Lucía Pérez Rodríguez', 0, 'Calle de la Rúa 35, León', '622667788', '1987-02-22'),
('Carlos Martín López', 1, 'Calle de Santa Ana 40, León', '633112233', '1990-07-07'),
('Elena González Martínez', 0, 'Calle de las Azucenas 18, León', '644889900', '1983-09-03'),
('Sergio Rodríguez Pérez', 1, 'Calle de San Juan 22, Palencia', '655667788', '1996-04-19'),
('Marina Martínez González', 0, 'Calle de Mayor 25, Palencia', '611112233', '1981-12-15'),
('Lucas Pérez Rodríguez', 1, 'Calle de la Puebla 30, Palencia', '622112233', '1994-05-10'),
('Valentina González López', 0, 'Calle de Mayor Antigua 35, Palencia', '633778899', '1987-10-27'),
('Daniel López Martínez', 1, 'Plaza Mayor 8, Zamora', '644445566', '1990-03-14'),
('Lucía Martínez Rodríguez', 0, 'Calle de la Horta 12, Zamora', '655112233', '1983-08-28'),
('Alejandro Pérez Sánchez', 1, 'Calle de Santa Clara 20, Zamora', '611778899', '1996-01-05'),
('María García Martínez', 0, 'Calle de Balborraz 25, Zamora', '622334455', '1981-06-21'),
('Sergio Rodríguez López', 1, 'Calle de la Almendra 30, Ávila', '633556677', '1994-11-16'),
('Valeria Martínez Pérez', 0, 'Calle del Rastro 35, Ávila', '644889900', '1987-04-02'),
('Javier González Rodríguez', 1, 'Calle del Rey 18, Ávila', '655667788', '1990-09-19'),
('Sara Pérez Martínez', 0, 'Calle de la Cruz 20, Ávila', '611334455', '1983-12-24'),
('Adrián García López', 1, 'Calle de las Hervencias 25, Segovia', '622556677', '1996-07-11'),
('Marta López García', 0, 'Calle del Puente de San Lorenzo 30, Segovia', '633778899', '1981-02-06'),
('Daniel Pérez Martínez', 1, 'Plaza Mayor 8, Segovia', '644445566', '1994-05-23'),
('Lucía Rodríguez López', 0, 'Calle del Valle de Luna 12, Segovia', '655112233', '1987-10-08'),
('Sergio Martínez Rodríguez', 1, 'Calle de San Quirce 20, Soria', '611223344', '1990-03-03'),
('Santiago Martínez Pérez', 1, 'Calle de La Alameda 18, Cuenca', '655889900', '1994-09-10'),
('Valentina Rodríguez Martínez', 0, 'Calle de Los Tintes 20, Cuenca', '611334455', '1987-02-05'),
('Iker García López', 1, 'Calle de Los Tiradores 25, Cuenca', '622556677', '1990-07-30'),
('Lucía Martínez Rodríguez', 0, 'Calle de La Ciudad Encantada 30, Cuenca', '633778899', '1983-11-18'),
('Marcos Pérez Martínez', 1, 'Calle del Alfonso VIII 35, Toledo', '644445566', '1996-04-03'),
('Marta López Rodríguez', 0, 'Calle de San Martín 40, Toledo', '655667788', '1981-07-26'),
('Sara García Martínez', 1, 'Calle de La Plata 18, Toledo', '611112233', '1994-12-19'),
('Javier Martínez López', 0, 'Calle del Greco 20, Toledo', '622334455', '1987-05-14'),
('Elena Pérez Rodríguez', 1, 'Calle de Santa Isabel 25, Toledo', '633556677', '1990-10-09'),
('Adrián Rodríguez Martínez', 0, 'Calle de La Ronda 30, Toledo', '644112233', '1983-03-04'),
('Lucía García Pérez', 1, 'Calle de La Merced 12, Ávila', '655445566', '1996-06-27'),
('Daniel López Martínez', 0, 'Calle del Rastro 15, Ávila', '611223344', '1981-09-21'),
('Sara Martínez Pérez', 1, 'Calle del Duque de Alba 20, Ávila', '622667788', '1994-12-16'),
('Iván González López', 0, 'Calle de La Victoria 25, Ávila', '633112233', '1987-11-11'),
('Valeria Rodríguez Martínez', 1, 'Calle de Los Reyes Católicos 30, Segovia', '644889900', '1990-02-06'),
('Diego López Pérez', 0, 'Calle de La Judería 35, Segovia', '655112233', '1983-05-31'),
('Marina Martínez García', 1, 'Calle de San Andrés 18, Segovia', '611778899', '1996-10-26'),
('Sergio Rodríguez López', 0, 'Calle de La Moneda 20, Segovia', '622112233', '1981-01-14'),
('Lucía Pérez Martínez', 1, 'Calle de Las Parras 25, Soria', '633667788', '1994-08-09'),
('Carlos López Rodríguez', 0, 'Calle de Los Pastores 30, Soria', '644445566', '1987-02-04'),
('Elena Martínez Pérez', 1, 'Calle del Collado 35, Soria', '655667788', '1990-05-21'),
('Javier Rodríguez Martínez', 0, 'Calle del Oeste 40, Soria', '611334455', '1983-10-16'),
('María García López', 1, 'Calle de La Vega 18, Guadalajara', '622556677', '1996-03-12'),
('Laura Pérez Martínez', 0, 'Calle Mayor 10, Guadalajara', '633445566', '1994-05-12'),
('Alejandro González Rodríguez', 1, 'Calle del Reloj 20, Guadalajara', '644889900', '1987-08-21'),
('Sofía Martínez López', 0, 'Calle del Carmen 30, Guadalajara', '655112233', '1990-02-14'),
('Daniel Pérez Sánchez', 1, 'Calle del Cervantes 35, Guadalajara', '611778899', '1983-11-07'),
('Marta López Martínez', 0, 'Calle de la Plaza Mayor 25, Guadalajara', '622556677', '1996-06-24'),
('Lucas Rodríguez Pérez', 1, 'Calle del Parque 40, Guadalajara', '633778899', '1981-09-17'),
('Sara García Martín', 0, 'Calle del Pilar 28, Guadalajara', '644445566', '1993-04-03'),
('Hugo Pérez García', 1, 'Calle de San Roque 22, Guadalajara', '655667788', '1986-01-29'),
('Paula López Rodríguez', 0, 'Calle de la Fuente 15, Guadalajara', '611334455', '1991-08-12'),
('Diego Martínez Martín', 1, 'Calle de la Estrella 20, Guadalajara', '622112233', '1994-03-25'),
('Lucía Pérez López', 0, 'Calle de la Iglesia 25, Guadalajara', '633667788', '1987-07-14'),
('Javier González Martínez', 1, 'Calle del Campo 30, Guadalajara', '644778899', '1990-12-28'),
('Carla Rodríguez López', 0, 'Calle del Río 12, Guadalajara', '655889900', '1983-05-01'),
('Marcos Martínez Pérez', 1, 'Calle de la Torre 20, Guadalajara', '611112233', '1996-10-16'),
('Elena García Rodríguez', 0, 'Calle del Sol 25, Guadalajara', '622334455', '1981-04-22'),
('Pablo López Martínez', 1, 'Calle de la Luna 30, Guadalajara', '633556677', '1994-11-26'),
('Valentina Rodríguez López', 0, 'Calle de la Montaña 35, Guadalajara', '644889900', '1987-10-27'),
('Iván Martínez Pérez', 1, 'Calle de la Ladera 40, Guadalajara', '655112233', '1990-07-30'),
('Lucía García Rodríguez', 0, 'Calle de la Colina 18, Guadalajara', '611778899', '1983-12-19'),
('Carlos Pérez Martínez', 1, 'Calle del Paseo 20, Guadalajara', '622667788', '1996-06-27'),
('Eva Martínez López', 0, 'Calle de la Vega 25, Guadalajara', '633112233', '1981-02-06'),
('Sergio González Pérez', 1, 'Calle de la Rambla 30, Guadalajara', '644445566', '1994-05-23'),
('Marina López Rodríguez', 0, 'Calle de la Avenida 35, Guadalajara', '655112233', '1987-10-08'),
('Javier Martínez Sánchez', 1, 'Calle de la Cuesta 18, Guadalajara', '611223344', '1990-03-03'),
('Lucía Pérez Martínez', 0, 'Calle de la Sierra 25, Madrid', '633667788', '1984-07-10'),
('Adrián Martínez Rodríguez', 1, 'Calle del Carmen 30, Barcelona', '644889900', '1997-01-15'),
('Valeria González López', 0, 'Calle del Mar 35, Valencia', '655667788', '1982-03-20'),
('Javier Pérez Martínez', 1, 'Calle de la Cruz 18, Sevilla', '611112233', '1995-08-25'),
('Marta Martínez López', 0, 'Calle del Paseo 20, Bilbao', '622334455', '1980-11-30'),
('Diego Rodríguez Pérez', 1, 'Calle de la Feria 25, Málaga', '633556677', '1993-06-05'),
('Elena García Martínez', 0, 'Calle del Sol 30, Alicante', '644445566', '1986-09-17'),
('Lucas Martínez Rodríguez', 1, 'Calle del Mar 35, Valencia', '655889900', '1991-12-10'),
('Sara Pérez López', 0, 'Calle de la Luna 18, Zaragoza', '611223344', '1984-05-15'),
('Adrián Rodríguez Martínez', 1, 'Calle de la Plaza 20, Málaga', '622556677', '1997-10-01'),
('Valentina López Pérez', 0, 'Calle del Carmen 25, Sevilla', '633778899', '1982-01-28'),
('Alejandro Martínez López', 1, 'Calle del Mar 30, Barcelona', '644112233', '1995-04-20'),
('Lucía Pérez García', 0, 'Calle de la Cruz 35, Valencia', '655445566', '1987-07-03'),
('Sergio Rodríguez Martínez', 1, 'Calle del Sol 18, Alicante', '611778899', '1990-10-18'),
('Marina García López', 0, 'Calle de la Feria 20, Málaga', '622112233', '1983-03-05'),
('Diego Martínez Pérez', 1, 'Calle de la Luna 25, Zaragoza', '633667788', '1996-08-28'),
('Eva López Martínez', 0, 'Calle del Mar 30, Barcelona', '644889900', '1981-11-12'),
('Marcos Rodríguez López', 1, 'Calle del Paseo 35, Bilbao', '655667788', '1994-02-14'),
('Lucía Martínez Pérez', 0, 'Calle del Carmen 18, Sevilla', '611334455', '1987-05-09'),
('Carlos González Martínez', 1, 'Calle del Sol 20, Alicante', '622556677', '1990-12-02'),
('Sara López Rodríguez', 0, 'Calle de la Cruz 25, Valencia', '633778899', '1983-04-17'),
('Lucas Martínez Pérez', 1, 'Calle del Mar 30, Barcelona', '644445566', '1996-09-28'),
('Valentina Rodríguez López', 0, 'Calle de la Feria 35, Málaga', '655889900', '1981-08-12'),
('Sergio Pérez García', 1, 'Calle del Sol 18, Alicante', '611112233', '1994-11-03'),
('Marina Martínez Rodríguez', 0, 'Calle del Paseo 20, Bilbao', '622334455', '1987-02-26'),
('Diego López Martínez', 1, 'Calle de la Luna 25, Zaragoza', '633556677', '1990-05-19'),
('Elena García López', 0, 'Calle del Mar 30, Barcelona', '644889900', '1983-12-07'),
('Adrián Martínez Pérez', 1, 'Calle del Sol 35, Alicante', '655112233', '1996-10-20'),
('Valeria López Rodríguez', 0, 'Calle de la Feria 18, Málaga', '611223344', '1981-03-01'),
('Santiago Martínez Pérez', 1, 'Calle Mayor 10, Madrid', '633445566', '1994-05-12'),
('Marina López Martínez', 0, 'Calle del Carmen 20, Barcelona', '644889900', '1987-08-21'),
('Lucas Pérez Rodríguez', 1, 'Calle de la Playa 30, Valencia', '655112233', '1990-02-14'),
('Aitana Martínez López', 0, 'Calle del Sol 35, Sevilla', '611778899', '1983-11-07'),
('Pablo González Pérez', 1, 'Calle Mayor 40, Bilbao', '622556677', '1996-06-24'),
('Elena Rodríguez Martín', 0, 'Calle de la Feria 25, Málaga', '633778899', '1981-09-17'),
('Hugo Martínez Rodríguez', 1, 'Calle del Paseo 28, Alicante', '644445566', '1993-04-03'),
('Julia Pérez López', 0, 'Calle del Mar 22, Zaragoza', '655667788', '1986-01-29'),
('Adrián García Martínez', 1, 'Calle de la Plaza 12, Palma de Mallorca', '611334455', '1991-08-12'),
('Sara López Rodríguez', 0, 'Calle del Sol 15, Santa Cruz de Tenerife', '622112233', '1984-03-25'),
('Iván Martínez Pérez', 1, 'Calle del Carmen 20, Las Palmas de Gran Canaria', '633667788', '1997-10-09'),
('María García López', 0, 'Calle de la Playa 25, Murcia', '644778899', '1982-07-14'),
('Alejandro Pérez Martín', 1, 'Calle Mayor 30, Córdoba', '655889900', '1995-12-28'),
('Lucía Martín Sánchez', 0, 'Calle del Paseo 8, Vigo', '611112233', '1983-05-01'),
('David Rodríguez López', 1, 'Calle del Mar 10, Gijón', '622334455', '1990-10-16'),
('Carla López Martínez', 0, 'Calle del Sol 15, Hospitalet de Llobregat', '633556677', '1985-04-30'),
('Javier González Pérez', 1, 'Calle Mayor 20, Badalona', '644112233', '1992-09-15'),
('Marta Rodríguez Martín', 0, 'Calle del Carmen 25, Hospitalet de Llobregat', '655445566', '1981-06-11'),
('Diego Martínez Sánchez', 1, 'Calle del Mar 30, Terrassa', '611223344', '1994-11-26'),
('Lucía Pérez Rodríguez', 0, 'Calle del Paseo 35, Sabadell', '622667788', '1987-02-22'),
('Carlos Martín López', 1, 'Calle Mayor 40, Tarragona', '633112233', '1990-07-07'),
('Elena González Martínez', 0, 'Calle del Carmen 18, Girona', '644889900', '1983-09-03'),
('Sergio Rodríguez Pérez', 1, 'Calle del Sol 22, Reus', '655667788', '1996-04-19'),
('Marina Martínez González', 0, 'Calle Mayor 25, Salamanca', '611112233', '1981-12-15'),
('Lucas Pérez Rodríguez', 1, 'Calle del Mar 30, Logroño', '622112233', '1994-05-10'),
('Valentina González López', 0, 'Calle del Paseo 35, Logroño', '633778899', '1987-10-27'),
('Daniel López Martínez', 1, 'Calle del Carmen 12, Logroño', '644445566', '1990-03-14'),
('Lucía Martínez Rodríguez', 0, 'Calle Mayor 15, Burgos', '655112233', '1983-08-28'),
('Laura Pérez Martínez', 0, 'Calle de Alcalá 25, Madrid', '633445566', '1984-07-10'),
('Alejandro González Rodríguez', 1, 'Avenida Diagonal 30, Barcelona', '644889900', '1997-01-15'),
('Sofía Martínez López', 0, 'Calle de Valencia 35, Valencia', '655667788', '1982-03-20'),
('Daniel Pérez Sánchez', 1, 'Calle Gran Vía 18, Madrid', '611112233', '1995-08-25'),
('Marta López Martínez', 0, 'Calle del Casco Viejo 20, Bilbao', '622334455', '1980-11-30'),
('Lucas Rodríguez Pérez', 1, 'Plaça Catalunya 25, Barcelona', '633556677', '1993-06-05'),
('Elena García Martínez', 0, 'Calle Mayor 30, Valencia', '644445566', '1986-09-17'),
('Lucas Martínez Rodríguez', 1, 'Paseo de Gracia 35, Barcelona', '655889900', '1991-12-10'),
('Sara Pérez López', 0, 'Gran Vía 18, Madrid', '611223344', '1984-05-15'),
('Adrián Rodríguez Martínez', 1, 'Calle de la Paz 20, Málaga', '622556677', '1997-10-01'),
('Valentina López Pérez', 0, 'Calle Larios 25, Málaga', '633778899', '1982-01-28'),
('Alejandro Martínez López', 1, 'Passeig de Gràcia 30, Barcelona', '644112233', '1995-04-20'),
('Lucía Pérez García', 0, 'Plaça de la Reina 35, Valencia', '655445566', '1987-07-03'),
('Sergio Rodríguez Martínez', 1, 'Carrer del Mar 18, Alicante', '611778899', '1990-10-18'),
('Marina García López', 0, 'Plaza Mayor 20, Málaga', '622112233', '1983-03-05'),
('Diego Martínez Pérez', 1, 'Calle Alcazabilla 25, Málaga', '633667788', '1996-08-28'),
('Eva López Martínez', 0, 'Carrer de Balmes 30, Barcelona', '644889900', '1981-11-12'),
('Marcos Rodríguez López', 1, 'Calle del Perro 35, Bilbao', '655667788', '1994-02-14'),
('Lucía Martínez Pérez', 0, 'Plaza de España 18, Sevilla', '611334455', '1987-05-09'),
('Carlos González Martínez', 1, 'Carrer del Mar 20, Alicante', '622556677', '1990-12-02'),
('Sara López Rodríguez', 0, 'Calle Sierpes 25, Sevilla', '633778899', '1983-04-17'),
('Lucas Martínez Pérez', 1, 'Calle Larios 30, Málaga', '644445566', '1996-09-28'),
('Valentina Rodríguez López', 0, 'Calle Granada 35, Granada', '655889900', '1981-08-12'),
('Sergio Pérez García', 1, 'Plaza de la Virgen 18, Valencia', '611112233', '1994-11-03'),
('Marina Martínez Rodríguez', 0, 'Calle de la Feria 20, Sevilla', '622334455', '1987-02-26'),
('Diego López Martínez', 1, 'Calle de la Paz 25, Granada', '633556677', '1990-05-19'),
('Elena García López', 0, 'Paseo de la Alameda 30, Valencia', '644889900', '1983-12-07'),
('Mateo Rodríguez Martínez', 1, 'Calle Mayor 10, Toledo', '633445566', '1994-05-12'),
('Luna Martínez López', 0, 'Calle del Sol 20, Valencia', '644889900', '1987-08-21'),
('Oliver Pérez Rodríguez', 1, 'Calle de la Luna 30, Valladolid', '655112233', '1990-02-14'),
('Isabella López Martínez', 0, 'Calle Mayor 35, Huelva', '611778899', '1983-11-07'),
('Leo Rodríguez Pérez', 1, 'Calle del Mar 40, Huesca', '622556677', '1996-06-24'),
('Lola García Martínez', 0, 'Calle de la Estrella 25, Jaén', '633778899', '1981-09-17'),
('Bruno Martínez Rodríguez', 1, 'Calle del Paseo 30, León', '644445566', '1993-04-03'),
('Abril Pérez López', 0, 'Calle Mayor 35, Lleida', '655667788', '1986-01-29'),
('Héctor Martínez Pérez', 1, 'Calle del Mar 40, Lugo', '611334455', '1991-08-12'),
('Lía Pérez Rodríguez', 0, 'Calle de la Luna 18, Albacete', '622112233', '1984-03-25'),
('Olivia García Martínez', 1, 'Calle Mayor 20, Almería', '633667788', '1997-10-09'),
('Luca López Pérez', 0, 'Calle del Carmen 25, Ávila', '644778899', '1982-07-14'),
('Elsa Martínez Rodríguez', 1, 'Calle del Sol 30, Badajoz', '655889900', '1995-12-28'),
('Gael Rodríguez López', 0, 'Calle Mayor 35, Barcelona', '611112233', '1983-05-01'),
('Emma Pérez Martínez', 1, 'Calle del Mar 40, Burgos', '622334455', '1990-10-16'),
('Nora Martínez López', 0, 'Calle Mayor 45, Cáceres', '633556677', '1985-04-30'),
('Hugo López Rodríguez', 1, 'Calle del Carmen 50, Cádiz', '644112233', '1992-09-15'),
('Vera Rodríguez Martínez', 0, 'Calle de la Luna 55, Cantabria', '655445566', '1981-06-11'),
('Iker Pérez López', 1, 'Calle del Mar 60, Castellón', '611223344', '1994-11-26'),
('Sofía García Rodríguez', 0, 'Calle Mayor 65, Ciudad Real', '622667788', '1987-02-22'),
('Zoe Martínez Pérez', 1, 'Calle del Sol 70, Córdoba', '633112233', '1990-07-07'),
('León López Martínez', 0, 'Calle Mayor 75, Cuenca', '644889900', '1983-09-03'),
('Maximiliano Rodríguez López', 1, 'Calle del Mar 80, Girona', '655667788', '1996-04-19'),
('Isla Martínez Rodríguez', 0, 'Calle Mayor 85, Granada', '611112233', '1981-12-15'),
('Luciano Pérez Martínez', 1, 'Calle del Sol 90, Guadalajara', '622112233', '1994-05-10'),
('Ada López Pérez', 0, 'Calle Mayor 95, Huelva', '633778899', '1987-10-27'),
('Milo Rodríguez López', 1, 'Calle del Mar 100, Huesca', '644445566', '1990-03-14'),
('Mía Martínez Rodríguez', 0, 'Calle Mayor 105, Jaén', '655112233', '1983-08-28');


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
('Camiseta de manga larga', 'Nike', 'M', 'Rojo', 'Algodón', 29.99, 1, 100),
('Camiseta sin mangas', 'Adidas', 'L', 'Verde', 'Poliéster', 19.99, 1, 200),
('Camiseta estampada', 'Puma', 'S', 'Amarillo', 'Algodón', 24.99, 1, 150),
('Camiseta casual', 'Pull&Bear', 'L', 'Blanco', 'Algodón', 19.99, 1, 130),
('Camiseta deportiva', 'Reebok', 'S', 'Verde', 'Poliéster', 29.99, 1, 140),
('Camisa formal', 'Tommy Hilfiger', 'M', 'Azul', 'Algodón', 49.99, 1, 120),
('Pantalón vaquero ajustado', 'Levis', '32', 'Azul', 'Denim', 79.99, 2, 50),
('Pantalón chino', 'Dockers', '34', 'Beige', 'Algodón', 59.99, 2, 80),
('Pantalón de lino', 'Zara', '36', 'Blanco', 'Lino', 69.99, 2, 60),
('Pantalón cargo', 'Zara', '34', 'Verde', 'Algodón', 39.99, 2, 110),
('Pantalón de vestir', 'Hugo Boss', '36', 'Negro', 'Lana', 99.99, 2, 90),
('Pantalón corto', 'H&M', '32', 'Azul', 'Denim', 29.99, 2, 100),
('Chaqueta de cuero', 'LeatherCraft', 'L', 'Negro', 'Cuero', 199.99, 3, 40),
('Chaqueta vaquera', 'Wrangler', 'M', 'Azul', 'Denim', 89.99, 3, 30),
('Chaqueta impermeable', 'The North Face', 'XL', 'Gris', 'Nailon', 159.99, 3, 70),
('Chaqueta bomber', 'Alpha Industries', 'M', 'Verde', 'Nailon', 149.99, 3, 60),
('Chaqueta de punto', 'Massimo Dutti', 'L', 'Gris', 'Lana', 119.99, 3, 50),
('Chaqueta de verano', 'Bershka', 'S', 'Beige', 'Algodón', 59.99, 3, 70),
('Zapatillas running', 'Nike', '42', 'Rojo', 'Sintético', 99.99, 4, 100),
('Zapatillas casual', 'Vans', '41', 'Negro', 'Tela', 59.99, 4, 120),
('Botas de montaña', 'Timberland', '43', 'Marrón', 'Cuero', 139.99, 4, 60),
('Zapatillas de skate', 'DC Shoes', '42', 'Negro', 'Cuero', 89.99, 4, 80),
('Zapatillas de baloncesto', 'Jordan', '44', 'Rojo', 'Sintético', 139.99, 4, 60),
('Sandalias de verano', 'Birkenstock', '41', 'Marrón', 'Cuero', 79.99, 4, 100),
('Jersey de lana', 'H&M', 'M', 'Gris', 'Lana', 49.99, 5, 50),
('Jersey cuello alto', 'Uniqlo', 'L', 'Negro', 'Algodón', 39.99, 5, 70),
('Jersey navideño', 'Primark', 'XL', 'Rojo', 'Acrílico', 29.99, 5, 80),
('Jersey de algodón', 'Uniqlo', 'M', 'Verde', 'Algodón', 39.99, 5, 110),
('Jersey de cachemira', 'Ralph Lauren', 'L', 'Azul', 'Cachemira', 199.99, 5, 40),
('Jersey con cremallera', 'Zara', 'XL', 'Gris', 'Algodón', 59.99, 5, 70),
('Sudadera deportiva', 'Nike', 'M', 'Azul', 'Poliéster', 49.99, 6, 100),
('Sudadera con cremallera', 'Adidas', 'L', 'Negro', 'Algodón', 59.99, 6, 90),
('Sudadera sin capucha', 'Reebok', 'S', 'Gris', 'Algodón', 39.99, 6, 110),
('Sudadera básica', 'Nike', 'S', 'Rojo', 'Algodón', 49.99, 6, 90),
('Sudadera con logo', 'Adidas', 'M', 'Blanco', 'Algodón', 59.99, 6, 100),
('Sudadera oversized', 'Pull&Bear', 'L', 'Gris', 'Algodón', 39.99, 6, 80),
('Top deportivo', 'Nike', 'M', 'Rosa', 'Poliéster', 29.99, 7, 100),
('Top de encaje', 'Victoria Secret', 'S', 'Blanco', 'Encaje', 39.99, 7, 90),
('Top básico', 'H&M', 'L', 'Negro', 'Algodón', 19.99, 7, 120),
('Top con tirantes', 'Stradivarius', 'M', 'Rosa', 'Algodón', 19.99, 7, 120),
('Top de manga larga', 'Mango', 'S', 'Negro', 'Algodón', 29.99, 7, 110),
('Top de encaje', 'Intimissimi', 'L', 'Blanco', 'Encaje', 39.99, 7, 100),
('Boxers', 'Calvin Klein', 'M', 'Blanco', 'Algodón', 25.99, 8, 200),
('Sujetador deportivo', 'Nike', 'L', 'Negro', 'Poliéster', 34.99, 8, 150),
('Camiseta térmica', 'Uniqlo', 'S', 'Azul', 'Poliéster', 29.99, 8, 100),
('Boxers de algodón', 'H&M', 'M', 'Negro', 'Algodón', 15.99, 8, 150),
('Sujetador push-up', 'Victoria Secret', 'L', 'Rojo', 'Poliéster', 49.99, 8, 90),
('Camiseta térmica', 'Uniqlo', 'S', 'Blanco', 'Poliéster', 29.99, 8, 100),
('Shorts vaqueros', 'Levis', '32', 'Azul', 'Denim', 49.99, 9, 100),
('Shorts de baño', 'Speedo', 'L', 'Rojo', 'Poliéster', 39.99, 9, 150),
('Shorts de deporte', 'Nike', 'M', 'Negro', 'Poliéster', 29.99, 9, 120),
('Shorts casual', 'Zara', '32', 'Azul', 'Denim', 39.99, 9, 80),
('Shorts deportivos', 'Adidas', 'L', 'Negro', 'Poliéster', 29.99, 9, 120),
('Shorts de playa', 'Quiksilver', 'M', 'Rojo', 'Poliéster', 49.99, 9, 100),
('Abrigo largo', 'Mango', 'M', 'Beige', 'Lana', 129.99, 10, 50),
('Abrigo acolchado', 'Uniqlo', 'L', 'Negro', 'Poliéster', 149.99, 10, 80),
('Abrigo de plumas', 'The North Face', 'XL', 'Azul', 'Plumas', 199.99, 10, 60),
('Abrigo elegante', 'Hugo Boss', 'M', 'Negro', 'Lana', 249.99, 10, 30),
('Abrigo informal', 'Uniqlo', 'L', 'Gris', 'Poliéster', 129.99, 10, 70),
('Abrigo de invierno', 'Columbia', 'XL', 'Verde', 'Plumas', 199.99, 10, 60),
('Chaleco de lana', 'Massimo Dutti', 'L', 'Marrón', 'Lana', 69.99, 11, 40),
('Chaleco de plumas', 'The North Face', 'M', 'Negro', 'Plumas', 129.99, 11, 60),
('Chaleco acolchado', 'Columbia', 'S', 'Azul', 'Poliéster', 89.99, 11, 70),
('Chaleco de vestir', 'Massimo Dutti', 'M', 'Negro', 'Lana', 99.99, 11, 50),
('Chaleco casual', 'Zara', 'L', 'Azul', 'Algodón', 49.99, 11, 40),
('Chaleco acolchado', 'The North Face', 'S', 'Gris', 'Poliéster', 89.99, 11, 60),
('Conjunto de yoga', 'Lululemon', 'S', 'Rosa', 'Poliéster', 89.99, 12, 100),
('Conjunto casual', 'H&M', 'M', 'Negro', 'Algodón', 69.99, 12, 80),
('Conjunto deportivo', 'Adidas', 'L', 'Gris', 'Poliéster', 99.99, 12, 70),
('Conjunto de pijama', 'Primark', 'S', 'Rosa', 'Algodón', 29.99, 12, 100),
('Conjunto de traje', 'Zara', 'M', 'Negro', 'Lana', 199.99, 12, 50),
('Conjunto de entrenamiento', 'Nike', 'L', 'Gris', 'Poliéster', 99.99, 12, 70),
('Camiseta básica', 'Uniqlo', 'S', 'Blanco', 'Algodón', 9.99, 1, 200),
('Camiseta gráfica', 'Urban Outfitters', 'M', 'Negro', 'Algodón', 29.99, 1, 150),
('Camiseta ajustada', 'Zara', 'L', 'Rojo', 'Algodón', 19.99, 1, 120),
('Camiseta con bolsillo', 'H&M', 'XL', 'Azul', 'Algodón', 14.99, 1, 100),
('Camiseta de rayas', 'Mango', 'M', 'Blanco', 'Algodón', 24.99, 1, 130),
('Camisa vaquera', 'Levis', 'L', 'Azul', 'Denim', 59.99, 1, 70),
('Camisa de cuadros', 'Burberry', 'S', 'Rojo', 'Algodón', 149.99, 1, 90),
('Camisa de lino', 'Massimo Dutti', 'M', 'Beige', 'Lino', 69.99, 1, 60),
('Camisa de franela', 'Uniqlo', 'L', 'Verde', 'Algodón', 39.99, 1, 80),
('Camisa con cuello mao', 'Zara', 'XL', 'Blanco', 'Algodón', 29.99, 1, 100),
('Pantalón pitillo', 'Topman', '30', 'Negro', 'Denim', 49.99, 2, 90),
('Pantalón de pana', 'J.Crew', '32', 'Marrón', 'Algodón', 59.99, 2, 70),
('Pantalón de chándal', 'Nike', '34', 'Gris', 'Poliéster', 39.99, 2, 110),
('Pantalón de vestir slim', 'Hugo Boss', '36', 'Azul', 'Lana', 99.99, 2, 50),
('Pantalón con pinzas', 'Zara', '30', 'Gris', 'Poliéster', 49.99, 2, 80),
('Pantalón palazzo', 'Mango', '32', 'Negro', 'Poliéster', 69.99, 2, 90),
('Pantalón jogger', 'Adidas', '34', 'Verde', 'Poliéster', 59.99, 2, 100),
('Pantalón cargo militar', 'Urban Outfitters', '36', 'Verde', 'Algodón', 79.99, 2, 60),
('Pantalón de ciclista', 'Rapha', '30', 'Negro', 'Lycra', 149.99, 2, 30),
('Pantalón de pinzas', 'Massimo Dutti', '32', 'Azul', 'Algodón', 59.99, 2, 70),
('Chaqueta de mezclilla', 'Levis', 'M', 'Azul', 'Denim', 89.99, 3, 80),
('Chaqueta parka', 'Canada Goose', 'L', 'Verde', 'Poliéster', 299.99, 3, 50),
('Chaqueta softshell', 'The North Face', 'XL', 'Negro', 'Poliéster', 159.99, 3, 60),
('Chaqueta de sastre', 'Tommy Hilfiger', 'M', 'Gris', 'Lana', 199.99, 3, 40),
('Chaqueta de borrego', 'Pull&Bear', 'L', 'Marrón', 'Poliéster', 89.99, 3, 70),
('Chaqueta cortavientos', 'Nike', 'S', 'Rojo', 'Nailon', 79.99, 3, 100),
('Chaqueta de terciopelo', 'Zara', 'XL', 'Negro', 'Poliéster', 99.99, 3, 90),
('Chaqueta sahariana', 'Mango', 'M', 'Beige', 'Algodón', 129.99, 3, 50),
('Chaqueta biker', 'Belstaff', 'L', 'Negro', 'Cuero', 299.99, 3, 20),
('Chaqueta varsity', 'Nike', 'M', 'Azul', 'Poliéster', 149.99, 3, 60),
('Zapatillas de trekking', 'Salomon', '43', 'Negro', 'Sintético', 119.99, 4, 50),
('Zapatillas slip-on', 'Vans', '42', 'Blanco', 'Tela', 49.99, 4, 100),
('Botines Chelsea', 'Dr. Martens', '41', 'Negro', 'Cuero', 159.99, 4, 30),
('Botas de lluvia', 'Hunter', '44', 'Verde', 'Caucho', 99.99, 4, 80),
('Mocasines', 'Gucci', '43', 'Marrón', 'Cuero', 349.99, 4, 20),
('Zapatillas de lona', 'Converse', '42', 'Rojo', 'Tela', 59.99, 4, 90),
('Sandalias deportivas', 'Teva', '41', 'Negro', 'Sintético', 69.99, 4, 100),
('Zapatillas de trail running', 'Asics', '44', 'Azul', 'Sintético', 129.99, 4, 70),
('Zapatos de vestir', 'Allen Edmonds', '43', 'Negro', 'Cuero', 299.99, 4, 50),
('Zapatillas de casa', 'UGG', '41', 'Gris', 'Lana', 79.99, 4, 60),
('Jersey con capucha', 'Carhartt', 'L', 'Verde', 'Algodón', 59.99, 5, 70),
('Jersey de punto grueso', 'Gant', 'M', 'Marrón', 'Lana', 99.99, 5, 60),
('Jersey cuello redondo', 'Uniqlo', 'S', 'Rojo', 'Algodón', 39.99, 5, 100),
('Jersey con botones', 'Tommy Hilfiger', 'XL', 'Azul', 'Algodón', 69.99, 5, 80),
('Jersey de lana merino', 'Icebreaker', 'L', 'Gris', 'Lana', 129.99, 5, 40),
('Jersey cuello barco', 'Mango', 'M', 'Beige', 'Algodón', 49.99, 5, 90),
('Jersey oversize', 'Zara', 'L', 'Negro', 'Algodón', 59.99, 5, 70),
('Jersey con cremallera', 'The North Face', 'M', 'Verde', 'Poliéster', 79.99, 5, 50),
('Jersey de cuello alto', 'Massimo Dutti', 'S', 'Gris', 'Cachemira', 199.99, 5, 30),
('Jersey con coderas', 'H&M', 'XL', 'Azul', 'Algodón', 39.99, 5, 100),
('Sudadera con capucha', 'Nike', 'L', 'Rojo', 'Poliéster', 49.99, 6, 80),
('Sudadera con bolsillos', 'Adidas', 'M', 'Negro', 'Algodón', 59.99, 6, 90),
('Sudadera sin mangas', 'Puma', 'S', 'Gris', 'Algodón', 39.99, 6, 100),
('Sudadera con capucha y cremallera', 'Reebok', 'XL', 'Verde', 'Poliéster', 69.99, 6, 60),
('Sudadera con estampado', 'Vans', 'L', 'Negro', 'Algodón', 49.99, 6, 70),
('Sudadera con capucha oversize', 'H&M', 'M', 'Rosa', 'Algodón', 39.99, 6, 100),
('Sudadera de felpa', 'Bershka', 'S', 'Gris', 'Algodón', 29.99, 6, 110),
('Sudadera deportiva con capucha', 'Nike', 'XL', 'Azul', 'Poliéster', 49.99, 6, 90),
('Sudadera con capucha casual', 'Pull&Bear', 'M', 'Blanco', 'Algodón', 39.99, 6, 80),
('Sudadera con estampado gráfico', 'Urban Outfitters', 'L', 'Negro', 'Algodón', 59.99, 6, 100),
('Top sin mangas', 'H&M', 'M', 'Blanco', 'Algodón', 19.99, 7, 100),
('Top con lentejuelas', 'Zara', 'S', 'Negro', 'Poliéster', 29.99, 7, 80),
('Top con escote en V', 'Mango', 'L', 'Rosa', 'Algodón', 24.99, 7, 110),
('Top de tirantes finos', 'Intimissimi', 'M', 'Blanco', 'Seda', 39.99, 7, 90),
('Top cruzado', 'Stradivarius', 'S', 'Rojo', 'Algodón', 19.99, 7, 100),
('Top palabra de honor', 'Bershka', 'L', 'Negro', 'Poliéster', 29.99, 7, 70),
('Top con manga abullonada', 'Pull&Bear', 'M', 'Beige', 'Algodón', 34.99, 7, 60),
('Top ajustado', 'Uniqlo', 'S', 'Azul', 'Algodón', 19.99, 7, 120),
('Top con nudo delantero', 'Urban Outfitters', 'M', 'Rojo', 'Algodón', 29.99, 7, 100),
('Top con volantes', 'Zara', 'L', 'Blanco', 'Poliéster', 24.99, 7, 90),
('Boxers de rayas', 'Calvin Klein', 'L', 'Azul', 'Algodón', 25.99, 8, 130),
('Sujetador balconette', 'Victoria Secret', 'M', 'Rosa', 'Poliéster', 49.99, 8, 70),
('Camiseta interior', 'Uniqlo', 'S', 'Negro', 'Algodón', 14.99, 8, 110),
('Boxers de seda', 'Tommy Hilfiger', 'M', 'Blanco', 'Seda', 39.99, 8, 90),
('Sujetador sin aros', 'H&M', 'L', 'Rojo', 'Algodón', 29.99, 8, 100),
('Camiseta térmica de lana', 'Icebreaker', 'S', 'Gris', 'Lana', 69.99, 8, 60),
('Boxers de microfibra', 'Under Armour', 'M', 'Negro', 'Poliéster', 29.99, 8, 120),
('Sujetador de encaje', 'Intimissimi', 'L', 'Blanco', 'Encaje', 49.99, 8, 80),
('Camiseta térmica de compresión', 'Nike', 'S', 'Azul', 'Poliéster', 34.99, 8, 100),
('Boxers de algodón orgánico', 'Patagonia', 'M', 'Verde', 'Algodón', 19.99, 8, 140),
('Shorts de ciclista', 'Rapha', 'L', 'Negro', 'Lycra', 99.99, 9, 40),
('Shorts de lino', 'Massimo Dutti', 'M', 'Blanco', 'Lino', 59.99, 9, 60),
('Shorts con bolsillos', 'Cargo', 'L', 'Marrón', 'Algodón', 39.99, 9, 110),
('Shorts deportivos', 'Nike', 'XL', 'Azul', 'Poliéster', 29.99, 9, 120),
('Shorts de tenis', 'Adidas', 'M', 'Blanco', 'Poliéster', 49.99, 9, 80),
('Shorts de punto', 'Zara', 'L', 'Rosa', 'Algodón', 29.99, 9, 100),
('Shorts casuales', 'H&M', 'M', 'Beige', 'Algodón', 19.99, 9, 90),
('Shorts de entrenamiento', 'Under Armour', 'S', 'Negro', 'Poliéster', 39.99, 9, 130),
('Shorts para correr', 'Asics', 'L', 'Rojo', 'Poliéster', 29.99, 9, 100),
('Shorts de playa', 'Quiksilver', 'M', 'Azul', 'Poliéster', 49.99, 9, 120),
('Abrigo con capucha', 'Mango', 'L', 'Gris', 'Lana', 149.99, 10, 50),
('Abrigo de piel', 'Max Mara', 'M', 'Negro', 'Piel', 299.99, 10, 20),
('Abrigo de lana merino', 'Icebreaker', 'S', 'Azul', 'Lana', 199.99, 10, 60),
('Abrigo de doble faz', 'Uniqlo', 'XL', 'Beige', 'Lana', 179.99, 10, 40),
('Abrigo acolchado largo', 'The North Face', 'M', 'Negro', 'Poliéster', 249.99, 10, 70),
('Abrigo con cinturón', 'Massimo Dutti', 'L', 'Gris', 'Lana', 199.99, 10, 50),
('Abrigo de tweed', 'Zara', 'M', 'Marrón', 'Lana', 149.99, 10, 60),
('Abrigo de borreguito', 'Pull&Bear', 'L', 'Beige', 'Poliéster', 99.99, 10, 80),
('Abrigo tres cuartos', 'Mango', 'XL', 'Azul', 'Lana', 129.99, 10, 40),
('Abrigo de piel sintética', 'Bershka', 'M', 'Rosa', 'Poliéster', 89.99, 10, 90),
('Chaleco de traje', 'Hugo Boss', 'M', 'Negro', 'Lana', 129.99, 11, 30),
('Chaleco de lana', 'Uniqlo', 'S', 'Gris', 'Lana', 49.99, 11, 60),
('Chaleco acolchado ligero', 'Patagonia', 'L', 'Verde', 'Poliéster', 99.99, 11, 70),
('Chaleco de algodón', 'Massimo Dutti', 'M', 'Azul', 'Algodón', 59.99, 11, 40),
('Chaleco de franela', 'J.Crew', 'L', 'Rojo', 'Algodón', 69.99, 11, 50),
('Chaleco con cremallera', 'Columbia', 'S', 'Negro', 'Poliéster', 89.99, 11, 70),
('Chaleco de punto', 'H&M', 'M', 'Beige', 'Algodón', 39.99, 11, 60),
('Chaleco polar', 'The North Face', 'L', 'Gris', 'Poliéster', 119.99, 11, 40),
('Chaleco de lana merino', 'Icebreaker', 'S', 'Azul', 'Lana', 149.99, 11, 50),
('Chaleco de plumas ultraligero', 'Uniqlo', 'M', 'Negro', 'Plumas', 59.99, 11, 60),
('Conjunto de lencería de encaje', 'Victoria Secret', 'S', 'Negro', 'Encaje', 79.99, 12, 30),
('Conjunto de pijama de seda', 'Intimissimi', 'M', 'Rojo', 'Seda', 99.99, 12, 20),
('Conjunto de chándal', 'Adidas', 'L', 'Gris', 'Poliéster', 89.99, 12, 50),
('Conjunto de ropa interior térmica', 'Uniqlo', 'S', 'Negro', 'Poliéster', 49.99, 12, 60),
('Conjunto de bikini', 'H&M', 'M', 'Rosa', 'Poliéster', 29.99, 12, 100),
('Conjunto de blazer y pantalón', 'Zara', 'L', 'Negro', 'Lana', 199.99, 12, 40),
('Conjunto deportivo de verano', 'Nike', 'M', 'Blanco', 'Poliéster', 59.99, 12, 70),
('Conjunto de pijama de algodón', 'Massimo Dutti', 'S', 'Azul', 'Algodón', 69.99, 12, 80),
('Conjunto de ropa de trabajo', 'Carhartt', 'M', 'Marrón', 'Algodón', 149.99, 12, 30),
('Conjunto de traje de baño', 'Quiksilver', 'L', 'Negro', 'Poliéster', 79.99, 12, 60);


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