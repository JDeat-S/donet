-- ACTUALIZAR CANTIDAD
CREATE PROCEDURE sp_Inventario_UpdateCantidad
    @ProductoId INT,
    @Cantidad INT
AS
BEGIN
    UPDATE Inventario
    SET Cantidad = @Cantidad,
        UltimaActualizacion = GETDATE()
    WHERE ProductoId = @ProductoId;
END
GO