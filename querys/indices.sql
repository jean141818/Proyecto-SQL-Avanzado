-- ===========================================
-- ÍNDICES
-- ===========================================

-- 1. Creación de índices básicos
CREATE INDEX IX_Clientes_Ciudad ON Clientes(Ciudad);
CREATE INDEX IX_Pedidos_Fecha ON Pedidos(FechaPedido DESC);
CREATE INDEX IX_Pedidos_ClienteEstado ON Pedidos(ClienteID, Estado);

-- 2. Índice único compuesto
CREATE UNIQUE INDEX UX_Clientes_Email ON Clientes(Email);

-- 3. Índice INCLUDE para queries covering
CREATE INDEX IX_Pedidos_Covering ON Pedidos(ClienteID, FechaPedido)
INCLUDE (Total, Estado);

-- 4. Índice filtrado (Filtered Index)
CREATE INDEX IX_Pedidos_Activos 
ON Pedidos(ClienteID, FechaPedido)
WHERE Estado = 'Pendiente';

-- 5. Consultas que se benefician de índices
-- Esta consulta usa el índice IX_Pedidos_ClienteEstado
SELECT * FROM Pedidos
WHERE ClienteID = 123 AND Estado = 'Completado';

-- 6. Análisis de performance
-- Usar Execution Plan (Ctrl + M) en SSMS
-- Observar si se usan los índices creados

-- 7. Índices Full-Text (si es necesario)
CREATE FULLTEXT CATALOG ftCatalog AS DEFAULT;
CREATE FULLTEXT INDEX ON Productos(Nombre, Categoria)
KEY INDEX PK_Productos
ON ftCatalog;

-- 8. Mantenimiento de índices
-- Reorganizar índices
ALTER INDEX IX_Clientes_Ciudad ON Clientes REORGANIZE;

-- Reconstruir índices fragmentados
ALTER INDEX ALL ON Pedidos REBUILD;

-- 9. Consultar información de índices
SELECT 
    t.name AS Tabla,
    i.name AS Indice,
    i.type_desc AS Tipo,
    i.is_unique AS Unico,
    i.has_filter AS Filtrado
FROM sys.indexes i
INNER JOIN sys.tables t ON i.object_id = t.object_id
WHERE i.type > 0  -- Excluir heap
ORDER BY t.name, i.name;