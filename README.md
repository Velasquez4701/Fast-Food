# Fast Food
## Descripción del Proyecto
Este proyecto, realizado para la cadena internacional de comida rápida "Fast Food", tiene como objetivo establecer una base de datos centralizada y optimizada para mejorar la toma de decisiones. 
Utilizando lenguajes de manipulación y definición de datos (DML y DDL), se creó una estructura de datos robusta que facilita el análisis y la generación de insights significativos.

## Estructura del Proyecto
Avance 1: Creación de la Base de Datos y Tablas
* Análisis de Requisitos: Identificación de entidades y atributos.
* Diseño de Tablas: Establecimiento de relaciones y definición de campos y tipos de datos.
  
Avance 2: Población de Tablas y Consultas Iniciales
* Importación de Datos: Carga de información proporcionada por "Fast Food".
* Consultas SQL: Respuesta a preguntas de negocios clave.
  
Avance 3: Consultas Avanzadas
* Funciones de Agregación: Uso de COUNT, SUM, AVG, MAX/MIN para obtener insights detallados.

Avance 4: Uso de JOIN y UNION
* Consultas Complejas: Combinación de múltiples conjuntos de datos para responder preguntas de negocios complejas.

## Esquema Relacional de la Base de Datos
* Productos: ProductoID (PK), Nombre, Precio, CategoríasID (FK)
* Categorías: CategoriaID (PK), Nombre
* Sucursales: SucursalesID (PK), Nombre, Dirección
* Empleados: EmpleadoID (PK), Nombre, Posición, Departamento, Rol, SucursalesID (FK)
* Clientes: ClienteID (PK), Nombre, Dirección
* OrigenesOrden: OrigenID (PK), Descripción
* TiposPago: TipoPagoID (PK), Descripción
* Mensajeros: MensajeroID (PK), Nombre, EsExterno
* Ordenes: OrdenID (PK), ClienteID (FK), EmpleadoID (FK), SucursalID (FK), MensajeroID (FK), TipoPagoID (FK), OrigenID (FK), HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista
* DetalleOrdenes: OrdenID (PK), ProductoID (PK), Cantidad, Precio
