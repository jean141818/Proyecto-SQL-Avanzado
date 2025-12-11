-- ===========================================
-- CONSULTAS CON JOIN
-- ===========================================

-- 1. INNER JOIN básico
SELECT 
    c.Nombre AS Cliente,
    p.FechaPedido,
    p.Total,
    p.Estado
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID;

-- 2. LEFT JOIN con condición WHERE
SELECT 
    c.Nombre AS Cliente,
    ISNULL(COUNT(p.PedidoID), 0) AS TotalPedidos,
    ISNULL(SUM(p.Total), 0) AS TotalGastado
FROM Clientes c
LEFT JOIN Pedidos p ON c.ClienteID = p.ClienteID
WHERE p.Estado = 'Completado' OR p.Estado IS NULL
GROUP BY c.Nombre;

-- 3. Múltiples JOINs
SELECT 
    c.Nombre AS Cliente,
    pr.Nombre AS Producto,
    dp.Cantidad,
    dp.PrecioUnitario,
    (dp.Cantidad * dp.PrecioUnitario) AS Subtotal
FROM Pedidos p
INNER JOIN Clientes c ON p.ClienteID = c.ClienteID
INNER JOIN DetallesPedido dp ON p.PedidoID = dp.PedidoID
INNER JOIN Productos pr ON dp.ProductoID = pr.ProductoID;

-- 4. SELF JOIN (ejemplo jerárquico)
SELECT 
    e1.Nombre AS Empleado,
    e2.Nombre AS Supervisor
FROM Empleados e1
LEFT JOIN Empleados e2 ON e1.SupervisorID = e2.EmpleadoID;