# donet
🧩 Product Management API (.NET + SQL Server)

Este proyecto forma parte de mi portafolio profesional como Desarrollador Full Stack, orientado a demostrar mis conocimientos en arquitectura, buenas prácticas y desarrollo de APIs con .NET y SQL Server.

🚀 Descripción

La Product Management API permite realizar operaciones CRUD (crear, leer, actualizar y eliminar) sobre un catálogo de productos, gestionando sus categorías, precios y disponibilidad.

El objetivo principal es mostrar un ejemplo funcional de:
Diseño limpio y estructurado en capas (Clean Architecture / N-Tier).
Uso eficiente de Entity Framework Core para acceso a datos.
Aplicación de principios SOLID y buenas prácticas en .NET.
Documentación de API con Swagger.

🛠️Tecnologías y herramientas utilizadas
.NET 8 (Web API)
C# 12
Entity Framework Core
SQL Server 2022
Swagger / Swashbuckle
AutoMapper
Dependency Injection
xUnit (para pruebas unitarias)
Docker (opcional para despliegue local)

📈 Mejoras futuras

Implementar autenticación JWT.
Integrar patrón CQRS.
Exponer endpoints para usuarios y pedidos.
Docker Compose con API + SQL Server.

🧪 Pruebas unitarias

Se incluyen pruebas básicas con xUnit para validar:
Creación de productos.
Actualización de registros.
Validaciones de datos.

Diagrama visual de estructura del proyecto.



           ┌──────────────────────────────────────────────────────────┐
           │                    ProductManagement.API                 │
           │        (Capa de Presentación / Endpoints públicos)       │
           │                                                          │
           │  - Controladores (ProductsController, etc.)              │
           │  - Configuración de servicios y middlewares              │
           │  - Swagger / Inyección de dependencias                   │
           │                                                          │
           │  ▶ Consume lógica desde Application                      │
           └──────────────────────────────────────────────────────────┘
                           │
                           ▼
            ┌──────────────────────────────────────────────────────────┐
            │               ProductManagement.Application              │
            │        (Capa de Lógica de Negocio / Reglas)              │
            │                                                          │
            │  - DTOs (Data Transfer Objects)                          │
            │  - Interfaces (IProductRepository, servicios)            │
            │  - Validaciones / AutoMapper / Casos de uso              │
            │                                                          │
            │  ▶ Define contratos que implementa Infrastructure        │
            └──────────────────────────────────────────────────────────┘
                           │
                           ▼
            ┌──────────────────────────────────────────────────────────┐
            │               ProductManagement.Infrastructure           │
            │         (Capa de Persistencia / Acceso a Datos)          │
            │                                                          │
            │  - DbContext (ProductDbContext)                          │
            │  - Implementaciones de repositorios                      │
            │  - Configuración de EF Core y migraciones                │
            │                                                          │
            │  ▶ Usa entidades de Domain                               │
            └──────────────────────────────────────────────────────────┘
                           │
                           ▼
            ┌──────────────────────────────────────────────────────────┐
            │                  ProductManagement.Domain                │
            │          (Capa de Entidades y Reglas de Dominio)         │
            │                                                          │
            │  - Entidades (Product, Category, etc.)                   │
            │  - Enums / Value Objects / Exceptions                    │
            │                                                          │
            │  ▶ No depende de ninguna otra capa                       │
            └──────────────────────────────────────────────────────────┘
                 ▲──────────────────────────▲

                 │         Referencias       │
                 └───────────────────────────┘
