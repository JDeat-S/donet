-- INSERT PRODUCTO
CREATE PROCEDURE sp_Productos_Insert
    @Nombre VARCHAR(150),
    @Descripcion VARCHAR(500),
    @Precio DECIMAL(10,2),
    @CategoriaId INT,
    @UsuarioId INT,
    @ImagenBase64 VARCHAR(MAX)
AS
BEGIN
    INSERT INTO Productos 
    (Nombre, Descripcion, Precio, CategoriaId, UsuarioId, ImagenBase64)
    VALUES (@Nombre, @Descripcion, @Precio, @CategoriaId, @UsuarioId, @ImagenBase64);
END
GO