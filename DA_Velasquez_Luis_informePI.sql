-- Posicionarse sobre la DB
USE FastFoodDB;


---- Eficiencia de los mensajeros
/*¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos por los mensajeros?*/

SELECT AVG(DATEDIFF(minute, FechaDespacho, FechaEntrega)) AS TiempoPromedioEnMinutos
FROM Ordenes;


---- Análisis de Ventas por Origen de Orden
/*¿Qué canal de ventas genera más ingresos?*/

SELECT
	os.Descripcion,
	SUM(TotalCompra) AS TotalVenta
FROM Ordenes o
JOIN OrigenesOrden os ON o.OrigenID = os.OrigenID
GROUP BY os.Descripcion
ORDER BY TotalVenta DESC;


---- Productividad de los Empleados
/*¿Cuál es el volumen de ventas promedio gestionado por empleado?*/

SELECT COUNT(OrdenID) AS PromedioVenta
FROM Ordenes o
JOIN Empleados e ON o.EmpleadoID = e.EmpleadoID;


---- Análisis de Demanda por Horario y Día
/*¿Cómo varía la demanda de productos a lo largo del día? 
NOTA: Esta consulta no puede ser implementada sin una definición clara del horario (mañana, tarde, noche) 
en la base de datos existente. Asumiremos que HorarioVenta refleja esta información correctamente.*/

SELECT
	HorarioVenta,
	SUM(d.Cantidad) AS DemandaProductos 
FROM Ordenes o
INNER JOIN DetalleOrdenes d ON o.OrdenID = d.OrdenID
GROUP BY HorarioVenta;


---- Comparación de Ventas Mensuales
/*¿Cómo se comparan las ventas mensuales de este año con el año anterior?*/

SELECT 
	FORMAT(FechaOrdenTomada, 'yyyy-MM') AS Periodo,
	SUM(TotalCOmpra) AS TotalVenta
FROM Ordenes
GROUP BY FechaOrdenTomada;


---- Análisis de Fidelidad del Cliente
/*¿Qué porcentaje de clientes son recurrentes versus nuevos clientes cada mes?
NOTA: La consulta se enfocaría en la frecuencia de órdenes por cliente para inferir la fidelidad*/

SELECT 
	ClienteID,
	COUNT(OrdenID) AS NumeroOrdenes
FROM Ordenes
GROUP BY ClienteID;
