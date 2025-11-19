-- SELECT PRODUCTOS
CREATE PROCEDURE sp_Productos_GetAll
AS
BEGIN
    SELECT P.ProductoId, P.Nombre, P.Descripcion, P.Precio,
           C.Nombre AS Categoria, U.Nombre + ' ' + U.Apellidos AS Vendedor,
           P.FechaPublicacion, P.Activo
    FROM Productos P
    INNER JOIN Categorias C ON P.CategoriaId = C.CategoriaId
    INNER JOIN Usuarios U ON P.UsuarioId = U.UsuarioId;
END
GO