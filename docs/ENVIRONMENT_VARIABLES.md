# Variables de entorno

## Politica de secretos

Los secretos reales no deben subirse al repositorio. Este proyecto versiona solo archivos `.env.example` para documentar las variables necesarias. En entornos productivos, los secretos deben gestionarse con mecanismos como GitHub Actions Secrets, Kubernetes Secrets, AWS Secrets Manager o herramientas equivalentes.

## Backend Laravel

| Variable | Ejemplo | Descripcion |
| --- | --- | --- |
| `APP_NAME` | `AcademicManagementAPI` | Nombre logico de la aplicacion |
| `APP_ENV` | `local` | Ambiente de ejecucion |
| `APP_KEY` | `base64:replace_this_with_local_generated_key` | Clave de aplicacion Laravel generada localmente |
| `APP_DEBUG` | `true` | Modo debug para desarrollo |
| `APP_URL` | `http://localhost:8000` | URL publica del backend |
| `LOG_CHANNEL` | `stack` | Canal de logs Laravel |
| `DB_CONNECTION` | `pgsql` | Driver de base de datos |
| `DB_HOST` | `database` | Host de base de datos dentro de Docker Compose |
| `DB_PORT` | `5432` | Puerto de base de datos |
| `DB_DATABASE` | `academic_management` | Nombre de base de datos |
| `DB_USERNAME` | `academic_user` | Usuario de base de datos |
| `DB_PASSWORD` | `academic_password` | Contrasena de desarrollo |
| `SESSION_DRIVER` | `database` | Driver de sesiones si aplica |
| `CACHE_STORE` | `database` | Driver de cache si aplica |
| `SANCTUM_STATEFUL_DOMAINS` | `localhost:8080` | Dominios autorizados para Sanctum |
| `FRONTEND_URL` | `http://localhost:8080` | URL del frontend |

## Frontend Vue

| Variable | Ejemplo | Descripcion |
| --- | --- | --- |
| `VITE_APP_NAME` | `Academic Management` | Nombre visible de la aplicacion |
| `VITE_API_BASE_URL` | `/api` | Base URL de la API cuando se usa el gateway Nginx |
| `VITE_AUTH_MODE` | `sanctum` | Modo de autenticacion esperado |

Modos recomendados:

| Modo | Valor |
| --- | --- |
| Desarrollo directo contra backend local | `http://localhost:8000/api` |
| Gateway Nginx / entrada unificada | `/api` |

Si el frontend utiliza Vue CLI en lugar de Vite, se debe mapear la variable de API al prefijo requerido por ese stack, por ejemplo `VUE_APP_API_BASE_URL`.

## Base de datos

| Variable | Ejemplo | Descripcion |
| --- | --- | --- |
| `POSTGRES_DB` | `academic_management` | Base creada por el contenedor PostgreSQL |
| `POSTGRES_USER` | `academic_user` | Usuario inicial |
| `POSTGRES_PASSWORD` | `academic_password` | Contrasena local |

## Variables futuras para cloud

| Variable | Uso futuro |
| --- | --- |
| `AWS_REGION` | Region objetivo para infraestructura AWS |
| `AWS_ACCOUNT_ID` | Identificador de cuenta AWS |
| `ECR_REPOSITORY_BACKEND` | Repositorio de imagen backend |
| `ECR_REPOSITORY_FRONTEND` | Repositorio de imagen frontend |
| `K8S_NAMESPACE` | Namespace de despliegue |
| `DATABASE_URL` | Cadena de conexion a base gestionada |
| `OBSERVABILITY_ENDPOINT` | Exportacion de metricas o logs |

## Recomendacion para maestria

Documentar variables permite evidenciar madurez operacional: la aplicacion se separa de la configuracion, facilita portabilidad entre ambientes y prepara el camino hacia despliegues automatizados.
