-- SELECT USUARIOS
CREATE PROCEDURE sp_Usuarios_GetAll
AS
BEGIN
    SELECT U.UsuarioId, U.Nombre, U.Apellidos, U.Email, U.FechaRegistro, U.Activo,
           R.Nombre AS Rol
    FROM Usuarios U
    INNER JOIN Roles R ON U.RoleId = R.RoleId;
END
GO