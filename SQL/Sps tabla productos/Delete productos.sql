-- DELETE PRODUCTO
CREATE PROCEDURE sp_Productos_Delete
    @ProductoId INT
AS
BEGIN
    DELETE FROM Productos WHERE ProductoId = @ProductoId;
END
GO