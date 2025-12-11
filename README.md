# 📊 PROYECTO SQL AVANZADO - Repositorio Profesional

![SQL Server 2019](https://img.shields.io/badge/SQL%2520Server-2019-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-005C84?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

---

## 📖 Descripción del Proyecto

Repositorio profesional que demuestra habilidades avanzadas en SQL Server 2019, implementando consultas complejas, optimización de bases de datos y mejores prácticas de desarrollo. Este proyecto sirve como portafolio técnico para desarrolladores SQL y administradores de bases de datos.

---

## 🎯 Objetivos de Aprendizaje

- ✅ Dominio de SQL Avanzado y T-SQL  
- ✅ Optimización de consultas con índices  
- ✅ Uso de CTEs y subconsultas complejas  
- ✅ Implementación de JOINs eficientes  
- ✅ Documentación profesional de código  
- ✅ Control de versiones con Git/GitHub  

---

## 🏗️ Estructura del Proyecto

```text
Proyecto-SQL-Avanzado/
├── 📁 01-consultas-basicas/
├── 📁 02-consultas-join/
├── 📁 03-subconsultas/
├── 📁 04-cte/
├── 📁 05-indices/
├── 📁 06-ejemplos-completos/
├── 📁 database/
├── 📄 README.md
└── 📄 .gitignore
```
## 🚀 Requisitos Previos
---
### ✅ Software Requerido
- Windows 11
- SQL Server 2019
- SQL Server Management Studio (SSMS)
- Git Bash o GitHub Desktop

## ⚙️ Configuración Inicial
```sql
Copiar código
USE master;
GO

CREATE DATABASE ProyectoSQL_Avanzado;
GO

Luego:

-- database/creacion.sql
```

### 🔧 Ejemplos de Código
1️⃣ Consultas Básicas
```sql
Copiar código
SELECT 
    Ciudad,
    COUNT(*) AS TotalClientes,
    AVG(DATEDIFF(DAY, FechaRegistro, GETDATE())) AS DiasRegistrado
FROM Clientes
GROUP BY Ciudad
HAVING COUNT(*) > 5;
```
2️⃣ JOINs Avanzados
```sql
Copiar código
SELECT 
    c.Nombre AS Cliente,
    p.FechaPedido,
    pr.Nombre AS Producto,
    dp.Cantidad,
    dp.PrecioUnitario * dp.Cantidad AS Subtotal
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID
INNER JOIN DetallesPedido dp ON p.PedidoID = dp.PedidoID
INNER JOIN Productos pr ON dp.ProductoID = pr.ProductoID
WHERE p.Estado = 'Completado'
AND p.FechaPedido >= DATEADD(MONTH, -6, GETDATE());
```
3️⃣ CTEs Recursivos
```sql
Copiar código
WITH Jerarquia AS (
    SELECT 
        EmpleadoID,
        Nombre,
        SupervisorID,
        1 AS Nivel
    FROM Empleados
    WHERE SupervisorID IS NULL
    
    UNION ALL
    
    SELECT 
        e.EmpleadoID,
        e.Nombre,
        e.SupervisorID,
        j.Nivel + 1
    FROM Empleados e
    INNER JOIN Jerarquia j ON e.SupervisorID = j.EmpleadoID
)
SELECT * FROM Jerarquia;
```
📈 Optimización de Performance
```sql
Copiar código
CREATE CLUSTERED INDEX IX_Pedidos_Fecha 
ON Pedidos(FechaPedido DESC);

CREATE NONCLUSTERED INDEX IX_Clientes_Ciudad_Registro
ON Clientes(Ciudad, FechaRegistro)
INCLUDE (Nombre, Email);

CREATE INDEX IX_Pedidos_Pendientes
ON Pedidos(ClienteID, FechaPedido)
WHERE Estado = 'Pendiente';
```
🧪 Casos de Uso Real
📅 Reporte de Ventas Mensual
```
```sql
Copiar código
WITH VentasMensual AS (
    SELECT 
        YEAR(FechaPedido) AS Año,
        MONTH(FechaPedido) AS Mes,
        COUNT(*) AS TotalPedidos,
        SUM(Total) AS VentasTotales,
        AVG(Total) AS TicketPromedio
    FROM Pedidos
    WHERE Estado = 'Completado'
    GROUP BY YEAR(FechaPedido), MONTH(FechaPedido)
)
SELECT *
FROM VentasMensual;
```
## 🚀 Cómo Usar Este Repositorio Para Aprendizaje
- Clona el repositorio
- Ejecuta los scripts
- Sigue los ejemplos en orden
- Experimenta modificando consultas

💻 Para Desarrollo
---
```bash
Copiar código
git clone https://github.com/jean141818/Proyecto-SQL-Avanzado.git
cd Proyecto-SQL-Avanzado

sqlcmd -S localhost -i database/creacion.sql
```
## 🏆 Habilidades Demostradas
---
- Habilidad	Nivel
- SQL	Avanzado
- Índices	Intermedio-Avanzado
- CTEs	Avanzado
- Subconsultas	Avanzado
- JOINs	Experto
- Git/GitHub	Intermedio



📄 Licencia
Este proyecto está bajo la licencia MIT.

👨‍💻 Autor
Jean Franco Noronha Chacaliaza
GitHub: @jean141818
LinkedIn: https://www.linkedin.com/in/jfnch18/



"Los datos son el nuevo petróleo, y SQL es el motor que lo procesa." 🚀
