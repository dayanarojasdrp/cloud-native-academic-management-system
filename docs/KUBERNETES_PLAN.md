# Plan Kubernetes

## Objetivo

Preparar el diseno de despliegue Kubernetes para una fase posterior. Este documento no implementa manifests todavia; define la arquitectura objetivo para ejecutar el sistema academico de forma orquestada, escalable y mantenible.

## Namespace

Se propone un namespace dedicado:

```text
academic-management
```

Esto permite aislar recursos, permisos, configuracion y politicas del sistema academico.

## Workloads

| Componente | Recurso Kubernetes | Consideraciones |
| --- | --- | --- |
| Frontend Vue | Deployment | Imagen estatica servida con Nginx |
| Backend Laravel | Deployment | Replicas horizontales, health checks, variables externalizadas |
| Base de datos | Servicio gestionado recomendado | En produccion se recomienda RDS u otro servicio administrado |
| Jobs Laravel | Job/CronJob | Migraciones, tareas programadas, procesos academicos |

## Services

- `frontend-service`: expone el frontend dentro del cluster.
- `backend-service`: expone la API para el frontend y el ingress.
- `database-service`: solo si se usa base dentro del cluster en ambientes no productivos.

## Ingress

El ingress permitira enrutar trafico HTTP/HTTPS:

| Ruta | Destino |
| --- | --- |
| `/` | Frontend |
| `/api` | Backend Laravel |

En produccion debera integrarse con TLS, certificados gestionados y reglas de seguridad.

## ConfigMaps

ConfigMaps almacenaran configuracion no sensible:

- `APP_ENV`
- `APP_URL`
- `FRONTEND_URL`
- `LOG_CHANNEL`
- URLs internas de servicios

## Secrets

Secrets almacenaran valores sensibles:

- `APP_KEY`
- credenciales de base de datos
- tokens de servicios externos
- credenciales de correo
- claves de integraciones futuras

## Health checks

El backend debe exponer:

- Liveness probe: confirma que el proceso esta vivo.
- Readiness probe: confirma que la API puede recibir trafico.

Endpoint recomendado:

```text
/api/health
```

## Horizontal Pod Autoscaler

Se recomienda HPA para backend y, si aplica, frontend:

- CPU promedio objetivo.
- Memoria como metrica adicional.
- Metricas personalizadas en fases avanzadas.

## Persistent volumes

En produccion, la base de datos no deberia ejecutarse como StatefulSet salvo razones especificas. Se recomienda una base administrada. Para ambientes de prueba se podrian usar PersistentVolumeClaims para PostgreSQL.

## Rolling updates

Los deployments deben usar rolling updates para reducir indisponibilidad:

- `maxUnavailable`: bajo o cero para backend critico.
- `maxSurge`: controlado segun capacidad del cluster.

## Futuras mejoras con Helm

Helm puede incorporarse cuando los manifests crezcan:

- Plantillas por ambiente.
- Values para desarrollo, staging y produccion.
- Versionado de releases.
- Integracion con GitOps.

## Criterio de entrada para implementar

Antes de crear manifests reales se recomienda tener:

- Imagenes Docker estables para backend y frontend.
- Endpoint `/api/health`.
- Variables externalizadas.
- Migraciones controladas.
- Estrategia de secretos.
- Pipeline Docker validado.
