-- Posicionarse sobre la DB
USE FastFoodDB;

-- Consulta 1: Listar todos los productos y sus categorías
SELECT p.ProductoID, p.Nombre AS NombreProducto, c.Nombre AS NombreCategoria, p.Precio
FROM Productos p
INNER JOIN Categorias c ON p.CategoriaID = c.CategoriaID;


-- Consulta 2: Obtener empleados y su sucursal asignada
SELECT e.EmpleadoID, e.Nombre AS NombreEmpleado, e.Posicion, e.Departamento, s.Nombre AS NombreSucursal, s.Direccion
FROM Empleados e
INNER JOIN Sucursales s ON e.SucursalID = s.SucursalID;


-- Consulta 3: Identificar productos sin categoría asignada
SELECT * FROM Productos p
LEFT JOIN Categorias c ON p.CategoriaID = c.CategoriaID
	WHERE c.CategoriaID IS NULL;


-- Consulta 4: Detalle completo de órdenes
SELECT
	c.Nombre AS NombreCliente,
	c.Direccion AS DireccionCliente,
    e.Nombre AS NombreEmpleado,
	e.Posicion AS PosicioEmpleado,
	e.Departamento AS DepartamentoEmpleado,
    m.Nombre AS NombreMensajero,
	m.EsExterno AS MensajeroEsExterno,
	o.HorarioVenta,
	o.TotalCompra,
	o.FechaDespacho,
	o.FechaEntrega,
	o.FechaOrdenTomada,
	o.FechaOrdenLista
FROM Ordenes o
INNER JOIN Clientes c ON o.ClienteID = c.ClienteID
INNER JOIN Empleados e ON o.EmpleadoID = e.EmpleadoID
INNER JOIN Mensajeros m ON o.MensajeroID = m.MensajeroID;


-- Consulta 5: Productos vendidos por sucursal
SELECT	
	s.Nombre AS Sucursal,
	c.Nombre AS Categoria,
	SUM(Cantidad)
FROM Ordenes o
INNER JOIN DetalleOrdenes d ON o.OrdenID = d.OrdenID
INNER JOIN Productos p ON d.ProductoID = p.ProductoID
INNER JOIN Categorias c ON p.CategoriaID = c.CategoriaID
INNER JOIN Sucursales s ON o.SucursalID = s.SucursalID
GROUP BY s.Nombre,c.Nombre

