-- INSERT USUARIO
CREATE PROCEDURE sp_Usuarios_Insert
    @Nombre VARCHAR(100),
    @Apellidos VARCHAR(150),
    @Email VARCHAR(150),
    @PasswordHash VARCHAR(500),
    @RoleId INT
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Apellidos, Email, PasswordHash, RoleId)
    VALUES (@Nombre, @Apellidos, @Email, @PasswordHash, @RoleId);
END
GO