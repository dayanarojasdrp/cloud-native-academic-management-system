# Despliegue local integrado

## Proposito

Este documento describe como ejecutar una demo local integrada usando Docker Compose. El objetivo es validar la comunicacion entre frontend, backend y base de datos sin desplegar todavia en infraestructura cloud.

## Prerrequisitos

- Docker Desktop o Docker Engine con Docker Compose.
- Repositorios backend y frontend clonados como directorios hermanos del repo DevOps.
- Archivos de variables de entorno generados desde los ejemplos.

Estructura esperada:

```text
workspace/
├── academic-management-api
├── academic-management-web
└── cloud-native-academic-management-system
```

## Configuracion inicial

El `docker-compose.yml` usa archivos `.env` locales. Los archivos `.env.example` son plantillas versionadas y no deben utilizarse como configuracion real de ejecucion:

```bash
cp env/backend.env.example env/backend.env
cp env/frontend.env.example env/frontend.env
```

Revisa las copias locales y ajusta credenciales, URL de aplicacion y configuracion de base de datos si fuera necesario.

Para generar una clave local de Laravel:

```bash
docker compose run --rm backend php artisan key:generate --show
```

Luego copia el valor generado en `APP_KEY` dentro de `env/backend.env`.

## Levantar servicios

```bash
docker compose up --build
```

Servicios principales:

| Servicio | URL interna | URL local esperada |
| --- | --- | --- |
| Frontend | `frontend:80` | `http://localhost:8080` |
| Backend | `backend:8000` | `http://localhost:8000` |
| Nginx proxy | `nginx:80` | `http://localhost:8088` |
| PostgreSQL | `database:5432` | `localhost:5432` |

## Modos de conexion del frontend con la API

| Modo | `VITE_API_BASE_URL` | Uso recomendado |
| --- | --- | --- |
| Desarrollo directo | `http://localhost:8000/api` | Cuando el navegador consume directamente el backend publicado en el puerto 8000 |
| Nginx gateway | `/api` | Cuando el frontend y la API se exponen detras del proxy `http://localhost:8088` |

El valor por defecto de las plantillas usa `/api` para favorecer el modo gateway y evitar acoplar el frontend a un puerto local especifico.

## Verificacion

Backend:

```bash
curl http://localhost:8000/api/health
```

Si el endpoint `/api/health` aun no existe en Laravel, se recomienda implementarlo en el backend como endpoint liviano para CI, Docker Compose y Kubernetes readiness probes.

Frontend:

```bash
open http://localhost:8080
```

Proxy Nginx:

```bash
open http://localhost:8088
```

## Migraciones

Para ejecutar migraciones dentro del contenedor backend:

```bash
docker compose exec backend php artisan migrate
```

Para limpiar y recrear datos en un entorno de demo:

```bash
docker compose exec backend php artisan migrate:fresh --seed
```

## Apagar servicios

```bash
docker compose down
```

Para eliminar tambien volumenes de base de datos local:

```bash
docker compose down -v
```

## Problemas comunes

| Problema | Causa probable | Accion recomendada |
| --- | --- | --- |
| El backend no conecta a la base de datos | Variables `DB_*` incorrectas | Verificar `env/backend.env` y nombre del host `database` |
| El frontend no consume la API | URL de API incorrecta | Ajustar `VITE_API_BASE_URL` o variable equivalente |
| Error de permisos en Laravel | Directorios `storage` o `bootstrap/cache` | Ajustar permisos en el repo backend o Dockerfile |
| `/api/health` devuelve 404 | Endpoint no implementado | Agregar endpoint de health check en Laravel |
| Puerto ocupado | Otro servicio usa el mismo puerto | Cambiar los puertos publicados en `docker-compose.yml` |

## Nota de alcance

Este despliegue es local y demostrativo. La ejecucion en nube, Kubernetes, balanceadores administrados, certificados TLS e infraestructura como codigo quedan planificados para fases posteriores.

El Dockerfile del backend usa `php artisan serve` porque esta orientado a demos locales integradas. Una imagen productiva deberia usar PHP-FPM con Nginx, Octane u otro runtime preparado para produccion, junto con hardening, health checks formales y gestion robusta de secretos.
