-- ===========================================
-- SUBCONSULTAS
-- ===========================================

-- 1. Subconsulta escalar en SELECT
SELECT 
    Nombre,
    Precio,
    (SELECT AVG(Precio) FROM Productos) AS PrecioPromedio,
    Precio - (SELECT AVG(Precio) FROM Productos) AS DiferenciaConPromedio
FROM Productos;

-- 2. Subconsulta en WHERE con IN
SELECT 
    Nombre,
    Ciudad
FROM Clientes
WHERE ClienteID IN (
    SELECT DISTINCT ClienteID 
    FROM Pedidos 
    WHERE Total > 500
);

-- 3. Subconsulta correlacionada
SELECT 
    c.Nombre,
    c.Ciudad,
    (SELECT COUNT(*) 
     FROM Pedidos p 
     WHERE p.ClienteID = c.ClienteID) AS TotalPedidos
FROM Clientes c;

-- 4. EXISTS
SELECT 
    Nombre,
    Email
FROM Clientes c
WHERE EXISTS (
    SELECT 1 
    FROM Pedidos p 
    WHERE p.ClienteID = c.ClienteID 
    AND p.Total > 1000
);