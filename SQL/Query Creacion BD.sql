/***************************************************************
    BASE DE DATOS MARKETPLACE
    Autor: Jhovan A. Gallardo (Portafolio)
***************************************************************/

CREATE DATABASE mkpDB;
GO
USE mkpDB;
GO

--TABLA: ROLES

CREATE TABLE Roles (
    RoleId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(200)
);
GO

INSERT INTO Roles (Nombre, Descripcion) VALUES
('Admin', 'Administrador del sistema'),
('Seller', 'Vendedor autorizado'),
('Customer', 'Cliente');
GO

-- TABLA: USUARIOS

CREATE TABLE Usuarios (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(150) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    PasswordHash VARCHAR(500) NOT NULL,
    RoleId INT NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Usuarios_Roles FOREIGN KEY(RoleId)
        REFERENCES Roles(RoleId)
);
GO

INSERT INTO Usuarios (Nombre, Apellidos, Email, PasswordHash, RoleId)
VALUES
('Jhovan', 'Gallardo Torres', 'jhovan@example.com', 'HASH123', 1),
('Carlos', 'Ramírez', 'carlos.seller@example.com', 'HASH456', 2),
('Luis', 'Mendoza', 'luis.customer@example.com', 'HASH789', 3);
GO

-- TABLA: CATEGORIAS

CREATE TABLE Categorias (
    CategoriaId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(300)
);
GO

INSERT INTO Categorias (Nombre, Descripcion) VALUES
('Electrónica', 'Artículos electrónicos'),
('Hogar', 'Productos del hogar'),
('Moda', 'Ropa y accesorios');
GO

-- TABLA: PRODUCTOS

CREATE TABLE Productos (
    ProductoId INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Descripcion VARCHAR(500),
    Precio DECIMAL(10,2) NOT NULL,
    CategoriaId INT NOT NULL,
    UsuarioId INT NOT NULL,
    ImagenBase64 VARCHAR(MAX), -- Imagen guardada como Base64
    FechaPublicacion DATETIME NOT NULL DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Productos_Categorias FOREIGN KEY(CategoriaId)
        REFERENCES Categorias(CategoriaId),
    CONSTRAINT FK_Productos_Usuarios FOREIGN KEY(UsuarioId)
        REFERENCES Usuarios(UsuarioId)
);
GO

INSERT INTO Productos (Nombre, Descripcion, Precio, CategoriaId, UsuarioId)
VALUES
('Smartphone XR10', 'Celular moderno con buena cámara', 4500, 1, 2),
('Mesa Plegable', 'Mesa ideal para departamentos pequeños', 1200, 2, 2),
('Sudadera Negra', 'Sudadera unisex cómoda para uso diario', 550, 3, 2);
GO

-- TABLA: INVENTARIO

CREATE TABLE Inventario (
    InventarioId INT IDENTITY(1,1) PRIMARY KEY,
    ProductoId INT NOT NULL,
    Cantidad INT NOT NULL,
    UltimaActualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Inventario_Productos FOREIGN KEY(ProductoId)
        REFERENCES Productos(ProductoId)
);
GO

INSERT INTO Inventario (ProductoId, Cantidad) VALUES
(1, 10),
(2, 5),
(3, 15);
GO