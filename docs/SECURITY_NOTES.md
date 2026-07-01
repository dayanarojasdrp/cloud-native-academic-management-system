# Notas de seguridad

## Principio central

El repositorio no debe contener secretos reales. Los archivos `.env.example` son plantillas; los archivos `.env` locales deben permanecer fuera de Git.

## Secretos y configuracion

- No versionar `APP_KEY`, credenciales de base de datos reales, tokens, claves API ni credenciales cloud.
- Usar GitHub Actions Secrets para credenciales de CI/CD cuando se active publicacion de imagenes.
- Usar Kubernetes Secrets, AWS Secrets Manager o una herramienta equivalente en despliegues productivos.
- Rotar secretos si alguna clave real fue expuesta accidentalmente.

## Contenedores

- Las imagenes actuales son base para integracion local.
- El backend usa `php artisan serve`, adecuado para demo local pero no para produccion.
- Una imagen productiva debe usar un runtime apropiado, usuario no root cuando sea posible, dependencias minimas y escaneo de vulnerabilidades.
- Las imagenes deben etiquetarse por version o SHA de commit cuando se publiquen en un registry.

## Frontend

- El servidor Nginx del frontend incluye fallback `try_files` para soportar rutas internas de Vue.
- La URL de API puede ser absoluta en desarrollo directo o relativa cuando se usa gateway.
- La configuracion productiva debe incorporar headers de seguridad y TLS en la capa de entrada.

## Backend

- El endpoint `/api/health` debe ser liviano y no exponer informacion sensible.
- La autenticacion Sanctum debe validar dominios permitidos, CORS y cookies seguras segun ambiente.
- Los logs no deben registrar contrasenas, tokens, documentos personales ni datos academicos sensibles.

## Referencia profesional

NIST SP 800-218 SSDF recomienda integrar practicas de desarrollo seguro en el ciclo de vida del software para reducir vulnerabilidades, mitigar impacto y prevenir recurrencias. Este repositorio adopta esa orientacion como criterio de evolucion, aunque la implementacion completa de seguridad queda para fases posteriores.
