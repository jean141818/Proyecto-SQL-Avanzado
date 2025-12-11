-- ===========================================
-- COMMON TABLE EXPRESSIONS (CTE)
-- ===========================================

-- 1. CTE básico
WITH VentasPorCliente AS (
    SELECT 
        ClienteID,
        COUNT(*) AS TotalPedidos,
        SUM(Total) AS TotalGastado
    FROM Pedidos
    WHERE Estado = 'Completado'
    GROUP BY ClienteID
)
SELECT 
    c.Nombre,
    vpc.TotalPedidos,
    vpc.TotalGastado,
    RANK() OVER (ORDER BY vpc.TotalGastado DESC) AS Ranking
FROM VentasPorCliente vpc
INNER JOIN Clientes c ON vpc.ClienteID = c.ClienteID;

-- 2. CTE recursivo (para jerarquías)
WITH JerarquiaEmpleados AS (
    -- Miembro ancla
    SELECT 
        EmpleadoID,
        Nombre,
        SupervisorID,
        1 AS Nivel,
        CAST(Nombre AS VARCHAR(255)) AS Ruta
    FROM Empleados
    WHERE SupervisorID IS NULL
    
    UNION ALL
    
    -- Miembro recursivo
    SELECT 
        e.EmpleadoID,
        e.Nombre,
        e.SupervisorID,
        je.Nivel + 1,
        CAST(je.Ruta + ' > ' + e.Nombre AS VARCHAR(255))
    FROM Empleados e
    INNER JOIN JerarquiaEmpleados je ON e.SupervisorID = je.EmpleadoID
)
SELECT * FROM JerarquiaEmpleados
ORDER BY Ruta;

-- 3. Múltiples CTEs
WITH 
ProductosCaros AS (
    SELECT * FROM Productos WHERE Precio > 100
),
VentasRecientes AS (
    SELECT * FROM Pedidos WHERE FechaPedido >= '2023-06-01'
),
DetallesVentas AS (
    SELECT 
        vr.PedidoID,
        pc.Nombre AS Producto,
        dp.Cantidad,
        dp.PrecioUnitario
    FROM VentasRecientes vr
    INNER JOIN DetallesPedido dp ON vr.PedidoID = dp.PedidoID
    INNER JOIN ProductosCaros pc ON dp.ProductoID = pc.ProductoID
)
SELECT * FROM DetallesVentas;