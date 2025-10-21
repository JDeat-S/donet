CREATE DATABASE ProductDB;
GO
USE ProductDB;
GO

-- Categorías
CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Productos
CREATE TABLE Products (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    Stock INT DEFAULT 0,
    CategoryId INT,
    IsActive BIT DEFAULT 1,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

-- Clientes
CREATE TABLE Customers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(150) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Phone NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Pedidos
CREATE TABLE Orders (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Pendiente',
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);

-- Detalle de pedidos
CREATE TABLE OrderDetails (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

-- Usuarios internos
CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50) DEFAULT 'User',
    CreatedAt DATETIME DEFAULT GETDATE()
);