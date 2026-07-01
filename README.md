# Cloud-Native Academic Management System

![Backend CI](https://github.com/dayanarojasdrp/cloud-native-academic-management-system/actions/workflows/backend-ci.yml/badge.svg)
![Frontend CI](https://github.com/dayanarojasdrp/cloud-native-academic-management-system/actions/workflows/frontend-ci.yml/badge.svg)
![Docker Build](https://github.com/dayanarojasdrp/cloud-native-academic-management-system/actions/workflows/docker-build.yml/badge.svg)

Repositorio central de arquitectura, integracion DevOps y preparacion cloud-native para un sistema academico orientado a instituciones de educacion superior.

El proyecto no solo desarrolla una aplicacion academica; tambien automatiza como se prueba, se empaqueta y se prepara para desplegarse en una arquitectura cloud-native.

## Proposito del sistema

El sistema busca modernizar procesos academicos que suelen gestionarse de forma fragmentada o manual: registro de estudiantes, matriculas, pagos, asignaturas, notas, certificados, roles, permisos, reportes y autenticacion. La propuesta integra una API Laravel, una interfaz Vue.js y una capa DevOps que formaliza calidad, reproducibilidad, automatizacion y preparacion para despliegue en nube.

Desde una perspectiva academica, este repositorio puede sustentar una investigacion de maestria sobre migracion cloud-native de sistemas de gestion academica en instituciones de educacion superior latinoamericanas, con foco en automatizacion, portabilidad, escalabilidad y gobierno tecnico.

## Repositorios del sistema

| Capa | Repositorio | Tecnologia | Responsabilidad |
| --- | --- | --- | --- |
| Backend | [dayanarojasdrp/academic-management-api](https://github.com/dayanarojasdrp/academic-management-api) | Laravel REST API | Logica academica, autenticacion Sanctum, datos y servicios API |
| Frontend | [Sunaymg04/academic-management-web](https://github.com/Sunaymg04/academic-management-web) | Vue.js | Interfaz de usuario para gestion academica |
| DevOps/Cloud | [dayanarojasdrp/cloud-native-academic-management-system](https://github.com/dayanarojasdrp/cloud-native-academic-management-system) | Docker, GitHub Actions, documentacion cloud-native | Integracion, calidad, empaquetado, arquitectura y roadmap cloud |

## Fase 3: Integracion DevOps

Esta fase convierte el proyecto en una base preparada para evolucionar hacia nube. La prioridad no es desplegar todavia en Kubernetes ni crear infraestructura real en AWS, sino establecer los artefactos que hacen posible una migracion disciplinada:

- Pipelines de integracion continua para backend y frontend.
- Construccion reproducible de imagenes Docker.
- Entorno local integrado con Docker Compose.
- Documentacion tecnica para despliegue, variables, decisiones y roadmap.
- Planes formales para Kubernetes, Terraform y observabilidad.

Los workflows incluidos validan el sistema integrado desde el repositorio DevOps. En fases posteriores, workflows equivalentes deben vivir tambien dentro de los repositorios backend y frontend para validar cambios en cada aplicacion desde su propio ciclo de desarrollo.

## Tecnologias consideradas

- Laravel, PHP, Composer y Laravel Sanctum.
- Vue.js, Node.js 24 y npm.
- Docker y Docker Compose.
- GitHub Actions para CI y validacion automatizada.
- PostgreSQL como base de datos recomendada para el entorno integrado.
- Nginx como reverse proxy opcional.
- Kubernetes, Terraform, Prometheus y Grafana como roadmap cloud-native.

## Estado actual y roadmap

| Area | Estado |
| --- | --- |
| Backend Laravel | Existente en repositorio independiente |
| Frontend Vue | Existente en repositorio independiente |
| Repositorio DevOps/Cloud | Estructura base creada en esta fase |
| Docker Compose | Preparado para demo local integrada |
| GitHub Actions | Workflows base para CI y builds |
| Kubernetes | Plan documentado, no implementado |
| Terraform | Plan documentado, no ejecutado |
| Observabilidad | Plan documentado, pendiente de instrumentacion |

Consulta [docs/CLOUD_NATIVE_ROADMAP.md](docs/CLOUD_NATIVE_ROADMAP.md) para la vision por fases.

## Estructura del repositorio

```text
cloud-native-academic-management-system/
├── README.md
├── docs/
│   ├── ARCHITECTURE.md
│   ├── DEVOPS_INTEGRATION.md
│   ├── DEPLOYMENT.md
│   ├── ENVIRONMENT_VARIABLES.md
│   ├── DECISIONS.md
│   ├── CLOUD_NATIVE_ROADMAP.md
│   ├── CURRENT_LIMITATIONS.md
│   ├── KUBERNETES_PLAN.md
│   ├── NEXT_STEPS.md
│   ├── RECOMMENDED_DIAGRAMS.md
│   ├── SECURITY_NOTES.md
│   ├── TERRAFORM_PLAN.md
│   └── OBSERVABILITY_PLAN.md
├── docker/
│   ├── backend.Dockerfile
│   ├── frontend.Dockerfile
│   ├── frontend-nginx.conf
│   └── nginx.conf
├── docker-compose.yml
├── .github/
│   └── workflows/
│       ├── backend-ci.yml
│       ├── frontend-ci.yml
│       └── docker-build.yml
├── env/
│   ├── backend.env.example
│   └── frontend.env.example
```

## Ejecucion local integrada

Este repositorio asume que los repositorios de backend y frontend existen como directorios hermanos:

```text
workspace/
├── academic-management-api
├── academic-management-web
└── cloud-native-academic-management-system
```

Para levantar el entorno integrado:

```bash
cp env/backend.env.example env/backend.env
cp env/frontend.env.example env/frontend.env
docker compose up --build
```

Mas detalles en [docs/DEPLOYMENT.md](docs/DEPLOYMENT.md).

## Current Limitations

- Kubernetes manifests are not implemented yet.
- Terraform modules are documented but not executed.
- Observability stack is planned but not instrumented.
- Docker Compose is intended for local integration only.
- Production deployment requires additional hardening.

See [docs/CURRENT_LIMITATIONS.md](docs/CURRENT_LIMITATIONS.md) for the detailed scope boundaries.

## Documentacion principal

- [Arquitectura](docs/ARCHITECTURE.md)
- [Integracion DevOps](docs/DEVOPS_INTEGRATION.md)
- [Despliegue local](docs/DEPLOYMENT.md)
- [Variables de entorno](docs/ENVIRONMENT_VARIABLES.md)
- [Decisiones tecnicas](docs/DECISIONS.md)
- [Roadmap cloud-native](docs/CLOUD_NATIVE_ROADMAP.md)
- [Limitaciones actuales](docs/CURRENT_LIMITATIONS.md)
- [Proximos pasos](docs/NEXT_STEPS.md)
- [Notas de seguridad](docs/SECURITY_NOTES.md)
- [Diagramas recomendados](docs/RECOMMENDED_DIAGRAMS.md)
- [Plan Kubernetes](docs/KUBERNETES_PLAN.md)
- [Plan Terraform](docs/TERRAFORM_PLAN.md)
- [Plan de observabilidad](docs/OBSERVABILITY_PLAN.md)
