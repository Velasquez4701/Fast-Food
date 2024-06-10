-- Posicionarse sobre la DB
USE FastFoodDB;


---- Eficiencia de los mensajeros
/*�Cu�l es el tiempo promedio desde el despacho hasta la entrega de los pedidos por los mensajeros?*/

SELECT AVG(DATEDIFF(minute, FechaDespacho, FechaEntrega)) AS TiempoPromedioEnMinutos
FROM Ordenes;


---- An�lisis de Ventas por Origen de Orden
/*�Qu� canal de ventas genera m�s ingresos?*/

SELECT
	os.Descripcion,
	SUM(TotalCompra) AS TotalVenta
FROM Ordenes o
JOIN OrigenesOrden os ON o.OrigenID = os.OrigenID
GROUP BY os.Descripcion
ORDER BY TotalVenta DESC;


---- Productividad de los Empleados
/*�Cu�l es el volumen de ventas promedio gestionado por empleado?*/

SELECT COUNT(OrdenID) AS PromedioVenta
FROM Ordenes o
JOIN Empleados e ON o.EmpleadoID = e.EmpleadoID;


---- An�lisis de Demanda por Horario y D�a
/*�C�mo var�a la demanda de productos a lo largo del d�a? 
NOTA: Esta consulta no puede ser implementada sin una definici�n clara del horario (ma�ana, tarde, noche) 
en la base de datos existente. Asumiremos que HorarioVenta refleja esta informaci�n correctamente.*/

SELECT
	HorarioVenta,
	SUM(d.Cantidad) AS DemandaProductos 
FROM Ordenes o
INNER JOIN DetalleOrdenes d ON o.OrdenID = d.OrdenID
GROUP BY HorarioVenta;


---- Comparaci�n de Ventas Mensuales
/*�C�mo se comparan las ventas mensuales de este a�o con el a�o anterior?*/

SELECT 
	FORMAT(FechaOrdenTomada, 'yyyy-MM') AS Periodo,
	SUM(TotalCOmpra) AS TotalVenta
FROM Ordenes
GROUP BY FechaOrdenTomada;


---- An�lisis de Fidelidad del Cliente
/*�Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes?
NOTA: La consulta se enfocar�a en la frecuencia de �rdenes por cliente para inferir la fidelidad*/

SELECT 
	ClienteID,
	COUNT(OrdenID) AS NumeroOrdenes
FROM Ordenes
GROUP BY ClienteID;
