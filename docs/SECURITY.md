# Seguridad

## Proposito

La seguridad de este prototipo se documenta como una disciplina transversal: configuracion, secretos, permisos, red, autenticacion, CI/CD y despliegue. La intencion no es declarar cumplimiento productivo, sino demostrar que la arquitectura reconoce riesgos reales y deja controles preparados para evolucionar.

## Controles incluidos

| Area | Control |
| --- | --- |
| Secretos | `.env` locales fuera de Git, examples sin claves reales, Kubernetes Secret examples |
| Kubernetes | NetworkPolicy para backend y PostgreSQL de laboratorio |
| Ingress | Rate limiting basico mediante anotaciones de Nginx Ingress |
| Terraform | IAM separado, security groups por capa, S3 privado y cifrado |
| CI/CD | Workflows separados para backend, frontend y build Docker |
| Configuracion | Variables externalizadas en ConfigMaps y env files |

## Secretos

No se deben versionar claves reales. Los archivos `*.example.yaml` y `.env.example` son plantillas. Para ejecutar en laboratorio se deben copiar fuera del repositorio o en rutas temporales:

```bash
cp k8s/base/backend-secret.example.yaml /tmp/backend-secret.yaml
cp k8s/observability/grafana-secret.example.yaml /tmp/grafana-secret.yaml
```

## IAM y least privilege

El baseline Terraform incluye IAM para el cluster EKS futuro. Aun falta separar roles operativos por funcion:

- Rol de CI/CD para publicar imagenes.
- Rol de despliegue para aplicar manifests.
- Rol de observabilidad para leer metricas.
- Roles de aplicacion con permisos minimos a secretos o servicios administrados.

## Security groups

El modulo Terraform separa:

- Entrada publica HTTP/HTTPS.
- Workloads de aplicacion.
- Base de datos restringida a workloads autorizados.

Antes de aplicar en AWS, estas reglas deben revisarse contra el balanceador, el ingress controller y la base de datos elegida.

## CORS y autenticacion

El backend Laravel debe mantener CORS y Sanctum controlados por ambiente:

- Permitir solo dominios conocidos.
- Separar configuracion local, staging y produccion.
- Evitar comodines en produccion.
- Validar roles y permisos por modulo academico.

## Rate limiting

El Ingress incluye un limite basico de solicitudes por segundo. En produccion debe complementarse con:

- Rate limiting de Laravel por rutas sensibles.
- Proteccion especial para login y recuperacion de cuenta.
- Observabilidad sobre respuestas 429.

## Policies y validaciones pendientes

- Validar manifests con una herramienta como kubeconform o kubeval.
- Definir Pod Security Standards por namespace.
- Agregar escaneo de imagenes en CI.
- Agregar revision de dependencias Composer y npm.
- Evaluar Kyverno, Gatekeeper u otra herramienta de policy-as-code.
