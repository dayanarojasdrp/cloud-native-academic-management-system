# CI/CD

## Proposito

La integracion continua del repositorio cloud valida la coherencia del sistema desde la capa DevOps: backend, frontend y construccion de imagenes. Este enfoque permite demostrar integracion entre repositorios sin mover toda la responsabilidad al codigo de aplicacion.

## Workflows incluidos

| Workflow | Archivo | Funcion |
| --- | --- | --- |
| Backend CI | [../.github/workflows/backend-ci.yml](../.github/workflows/backend-ci.yml) | Instala PHP, Composer, prepara SQLite, migra, prueba y ejecuta Pint si existe |
| Frontend CI | [../.github/workflows/frontend-ci.yml](../.github/workflows/frontend-ci.yml) | Instala Node, dependencias, lint si existe y build |
| Docker Build | [../.github/workflows/docker-build.yml](../.github/workflows/docker-build.yml) | Construye imagenes backend/frontend sin publicarlas |

## Alcance actual

Los workflows se ejecutan desde el repositorio DevOps. Esto es correcto para una fase de integracion central, pero no reemplaza CI propio en los repositorios de aplicacion.

Trabajo recomendado:

- Agregar CI nativo en `academic-management-api`.
- Agregar CI nativo en `academic-management-web`.
- Publicar imagenes en GitHub Container Registry solo cuando los pipelines sean estables.
- Usar tags por SHA o version, no `latest`, para despliegues reproducibles.

## Seguridad en CI/CD

- No usar secretos reales en archivos YAML.
- Usar GitHub Actions Secrets para registry y credenciales cloud.
- Limitar permisos del token de GitHub Actions.
- Agregar escaneo de dependencias y contenedores en una fase posterior.

## Proxima mejora

Cuando el proyecto este listo para publicar imagenes:

1. Activar login a GitHub Container Registry.
2. Etiquetar imagenes con `${{ github.sha }}`.
3. Actualizar manifests Kubernetes con tags inmutables.
4. Agregar aprobacion manual antes de cualquier despliegue.
