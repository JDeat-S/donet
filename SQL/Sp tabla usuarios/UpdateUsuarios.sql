-- UPDATE USUARIO
CREATE PROCEDURE sp_Usuarios_Update
    @UsuarioId INT,
    @Nombre VARCHAR(100),
    @Apellidos VARCHAR(150),
    @Email VARCHAR(150),
    @RoleId INT,
    @Activo BIT
AS
BEGIN
    UPDATE Usuarios
    SET Nombre = @Nombre,
        Apellidos = @Apellidos,
        Email = @Email,
        RoleId = @RoleId,
        Activo = @Activo
    WHERE UsuarioId = @UsuarioId;
END
GO