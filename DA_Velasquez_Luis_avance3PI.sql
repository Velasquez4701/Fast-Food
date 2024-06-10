USE FastFoodDB;

-- Consulta 1: Total de ventas globales
SELECT SUM(TotalCompra) AS VentasGlobales FROM Ordenes;

-- Consulta 2: Promedio de precios de producto por categoria
SELECT CategoriaID, 
		AVG(Precio) AS PrecioPromedio
FROM Productos
GROUP BY CategoriaID;

-- Consulta 3: Orden minima y maxima por sucursal
SELECT SucursalID,
		MIN(TotalCompra) AS Minimo,
		MAX(TotalCompra) AS Maximo
FROM Ordenes
GROUP BY SucursalID;

-- Consulta 4: Mayor numero de kilometros recorridos para entrega
SELECT MAX(KilometrosRecorrer) AS KM FROM Ordenes;

-- Consulta 5: Promedio de cantidad de productos por orden
SELECT AVG(Cantidad) AS PromedioProductos FROM DetalleOrdenes;

-- Consulta 6: Total de ventas por tipo de pago
SELECT TipoPagoID, SUM(TotalCompra) AS Ventas
FROM Ordenes
GROUP BY TipoPagoID;

-- Consulta 7: Sucursal con la venta promedio mas alta
SELECT TOP 1 SucursalID, AVG(TotalCompra) AS PromedioCompra
FROM Ordenes
GROUP BY SucursalID
ORDER BY PromedioCompra DESC;

-- Consulta 8: Sucursal con la mayor cantidad de ventas por encima de un umbral
SELECT SucursalID, 
		SUM(TotalCompra) AS VentaTotales
		-- COUNT(OrdenID) AS CantidadDeOrdenes
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) > 65 -- Al no haber Ordenes con Mayor a 100, se utiliza como mayor a 65
ORDER BY VentaTotales DESC;

-- Consulta 9: Comparacion de ventas promedio antes y despues de una fecha especifica
SELECT AVG(TotalCompra) AS PromedioVenta,
		'Promedio Venta ANTES del Julio 2023' AS Comentario
FROM Ordenes
WHERE FechaOrdenTomada < '2023-07-01'
UNION -- Anexo las consultas individuales
SELECT AVG(TotalCompra) AS PromedioVenta,
		'Promedio Venta DESPUES del Julio 2023' AS Comentario
FROM Ordenes
WHERE FechaOrdenTomada > '2023-07-01'
ORDER BY PromedioVenta DESC; -- Al final de toda la instruccion de codigo

-- Consulta 10: Analisis de actividad de ventas por horario
SELECT HorarioVenta,
		COUNT(OrdenID) AS NumeroDeVentas,
		AVG(TotalCompra) AS PromedioDeVenta,
		MAX(TotalCompra) AS VentaMaxima
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY VentaMaxima;
