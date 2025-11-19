-- SELECT INVENTARIO
CREATE PROCEDURE sp_Inventario_GetAll
AS
BEGIN
    SELECT I.InventarioId, P.Nombre, I.Cantidad, I.UltimaActualizacion
    FROM Inventario I
    INNER JOIN Productos P ON I.ProductoId = P.ProductoId;
END
GO