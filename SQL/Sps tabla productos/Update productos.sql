-- UPDATE PRODUCTO
CREATE PROCEDURE sp_Productos_Update
    @ProductoId INT,
    @Nombre VARCHAR(150),
    @Descripcion VARCHAR(500),
    @Precio DECIMAL(10,2),
    @CategoriaId INT,
    @Activo BIT
AS
BEGIN
    UPDATE Productos
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        Precio = @Precio,
        CategoriaId = @CategoriaId,
        Activo = @Activo
    WHERE ProductoId = @ProductoId;
END
GO