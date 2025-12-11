USE ProyectoSQL_Avanzado;
GO

-- ===========================================
-- CONSULTAS BÁSICAS
-- ===========================================

-- 1. SELECT básico con columnas específicas
SELECT 
    ClienteID,
    Nombre,
    Email,
    Ciudad,
    YEAR(FechaRegistro) AS AñoRegistro
FROM Clientes;

-- 2. SELECT con cálculos y alias
SELECT 
    Nombre,
    Precio,
    Stock,
    Precio * Stock AS ValorTotalInventario
FROM Productos;

-- 3. Filtrado con WHERE
SELECT *
FROM Pedidos
WHERE Estado = 'Completado'
    AND Total > 1000
    AND YEAR(FechaPedido) = 2023;

-- 4. Agregación con GROUP BY
SELECT 
    Ciudad,
    COUNT(*) AS TotalClientes,
    MIN(FechaRegistro) AS PrimerRegistro,
    MAX(FechaRegistro) AS UltimoRegistro
FROM Clientes
GROUP BY Ciudad;

-- 5. Ordenación con ORDER BY
SELECT 
    Nombre,
    Precio,
    Categoria
FROM Productos
ORDER BY 
    Categoria ASC,
    Precio DESC;