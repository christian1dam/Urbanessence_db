--TABLAS CREADAS POR CHRISTIAN

--CREACION TABLA TIENDA

CREATE TABLE tienda(
	id INT IDENTITY(1,1) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	direccion NVARCHAR(30) NOT NULL,
	telefono NVARCHAR(9) NOT NULL, ---COMO SE CONTEMPLA QUE SERA ESPA�OLA SOLAMENTE ACEPTARA 9 DIGITOS.
	horario TIME NOT NULL,
	numEmpleados INT NOT NULL,
	ciudadID INT NOT NULL,
	CONSTRAINT PK_Tienda PRIMARY KEY(id),
	CONSTRAINT FK_CiudadTienda FOREIGN KEY(ciudadID) REFERENCES ciudad(id)
);

--CREACION TABLA PERTENECER ES LA TABLA RELACI�N ENTRE PRODUCTO Y TIENDA

CREATE TABLE productoPerteneceTienda(
	productoID INT NOT NULL,
	tiendaID INT NOT NULL,
	cantidad INT NOT NULL,
	CONSTRAINT PK_ProductoPerteneceTienda PRIMARY KEY(productoID, tiendaID),
	CONSTRAINT FK_ProductoPPT FOREIGN KEY(productoID) REFERENCES producto(productoID),
	CONSTRAINT FK_TiendaPPT FOREIGN KEY(tiendaID) REFERENCES tienda(id)
);