-- Creacion de Base de Datos
CREATE DATABASE FastFoodDB;

-- Posicionarse sobre la DB
USE FastFoodDB;

-- Creacion de tablas
CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	CategoriaID INT,  -- Referencia a la Clave Primaria de Tabla Categoria
	Precio DECIMAL(10,2) NOT NULL,
);

CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
);

CREATE TABLE Sucursales(
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Direccion VARCHAR(255)
);

CREATE TABLE Empleados(
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Posicion VARCHAR(255),
	Departamento VARCHAR(255),
	SucursalID INT,
);
-- Generar un campo llamado Rol en Empleados
ALTER TABLE Empleados
ADD Rol Varchar(255);

CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	Direccion VARCHAR(255)
);

CREATE  TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(255) NOT NULL,
);

CREATE TABLE TiposPago(
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR(255) NOT NULL,
);

CREATE TABLE Mensajeros(
	MensajeroID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL,
	EsExterno BIT NOT NULL,
);

CREATE TABLE Ordenes(
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,
	SucursalID INT,
	MensajeroID INT,
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR(50),
	TotalCompra DECIMAL(10, 2),
	KilometrosRecorrer DECIMAL(10, 2),
	FechaDespacho DATETIME,
	FechaEntrega DATETIME,
	FechaOrdenTomada DATETIME,
	FechaOrdenLista DATETIME,
);

CREATE TABLE DetalleOrdenes(
	OrdenID INT,
	ProductoID INT,
	Cantidad INT,
	Precio DECIMAL(10,2),
	PRIMARY KEY (OrdenID, ProductoID),
);

--------- Generar relaciones ----------

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias
FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Sucursal
FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Empleado
FOREIGN KEY(EmpleadoID) REFERENCES Empleados(EmpleadoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajero
FOREIGN KEY(MensajeroID) REFERENCES Mensajeros(MensajeroID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_TipoPago
FOREIGN KEY(TipoPagoID) REFERENCES TiposPago(TipoPagoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Cliente
FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_OrigenesOrden
FOREIGN KEY(OrigenID) REFERENCES OrigenesOrden(OrigenID);

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Sucursal
FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_DetalleOrdenes_Orden
FOREIGN KEY(OrdenID) REFERENCES Ordenes(OrdenID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_DetalleOrden_Producto
FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID);
