-- DELETE USUARIO
CREATE PROCEDURE sp_Usuarios_Delete
    @UsuarioId INT
AS
BEGIN
    DELETE FROM Usuarios WHERE UsuarioId = @UsuarioId;
END
GO