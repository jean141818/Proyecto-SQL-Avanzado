-- Crear base de datos para el proyecto
CREATE DATABASE ProyectoSQL_Avanzado;
GO

USE ProyectoSQL_Avanzado;
GO

-- Crear tablas de ejemplo
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Email VARCHAR(100),
    FechaRegistro DATE,
    Ciudad VARCHAR(50)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    FechaPedido DATE,
    Total DECIMAL(10,2),
    Estado VARCHAR(20)
);

CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(10,2),
    Stock INT
);

CREATE TABLE DetallesPedido (
    DetalleID INT PRIMARY KEY IDENTITY(1,1),
    PedidoID INT FOREIGN KEY REFERENCES Pedidos(PedidoID),
    ProductoID INT FOREIGN KEY REFERENCES Productos(ProductoID),
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2)
);
GO

-- Insertar datos de ejemplo
INSERT INTO Clientes (Nombre, Email, FechaRegistro, Ciudad)
VALUES 
    ('Juan Pérez', 'juan@email.com', '2023-01-15', 'Madrid'),
    ('Ana García', 'ana@email.com', '2023-02-20', 'Barcelona'),
    ('Carlos López', 'carlos@email.com', '2023-03-10', 'Madrid');

INSERT INTO Productos (Nombre, Categoria, Precio, Stock)
VALUES
    ('Laptop', 'Electrónica', 1200.00, 10),
    ('Mouse', 'Electrónica', 25.50, 50),
    ('Libro SQL', 'Libros', 45.00, 30);

