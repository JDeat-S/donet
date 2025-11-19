USE [master]
GO

-- 1. Verificar si el LOGIN ya existe y, si existe, borrarlo (opcional, solo para scripts de prueba)
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'MKPusr')
    DROP LOGIN MKPusr
GO

-- 2. Crear el nuevo LOGIN con autenticación de SQL Server
CREATE LOGIN MKPusr
WITH PASSWORD = 'MKPbd', 
     DEFAULT_DATABASE = [master], -- Establecer una base de datos por defecto
     CHECK_EXPIRATION = OFF,      -- Desactivar expiración de contraseña (típico para cuentas de servicio)
     CHECK_POLICY = OFF           -- Desactivar políticas de complejidad de contraseña
GO

PRINT 'Login MKPusr creado exitosamente a nivel de servidor.'
GO