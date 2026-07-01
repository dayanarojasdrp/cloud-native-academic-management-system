# Contexto de investigacion

## Tema propuesto

Modernizacion cloud-native de un sistema de gestion academica mediante practicas DevOps, contenedorizacion, CI/CD, Kubernetes, infraestructura como codigo, seguridad y observabilidad.

## Problema

Muchas instituciones de educacion superior mantienen procesos academicos distribuidos entre herramientas locales, aplicaciones monoliticas o sistemas con baja automatizacion operacional. Esto dificulta escalar, auditar cambios, reproducir ambientes, integrar nuevos servicios y sostener disponibilidad en periodos criticos como matriculas, pagos y emision de certificados.

## Propuesta

El proyecto plantea un prototipo compuesto por:

- API Laravel para servicios academicos.
- Frontend Vue.js para interfaz de usuario.
- Repositorio cloud como centro de arquitectura, DevOps, despliegue, seguridad, observabilidad y documentacion de investigacion.

La contribucion no esta solo en construir la aplicacion, sino en demostrar como una solucion academica puede evolucionar hacia una arquitectura cloud-native por fases, sin exigir gasto cloud prematuro.

## Pregunta orientadora

Como pueden las practicas DevOps y cloud-native mejorar la confiabilidad de despliegue, escalabilidad, mantenibilidad e interoperabilidad de sistemas de gestion academica en instituciones de educacion superior?

## Alcance del prototipo

| Dimension | Evidencia en el repositorio |
| --- | --- |
| Automatizacion | GitHub Actions para backend, frontend y Docker |
| Portabilidad | Dockerfiles y Docker Compose |
| Orquestacion | Kubernetes baseline |
| Infraestructura como codigo | Terraform baseline AWS |
| Seguridad | Secrets, NetworkPolicy, IAM, security groups, CORS documentado |
| Observabilidad | Prometheus, Grafana, health checks y alertas iniciales |
| Gobierno tecnico | Decisiones, roadmap, limitaciones y proximos pasos |

## Limites declarados

- No se aplica infraestructura cloud por falta de presupuesto en esta etapa.
- Kubernetes se mantiene como baseline de laboratorio hasta probarlo en cluster.
- Observabilidad esta preparada, pero requiere instrumentacion real del backend.
- Helm queda reservado para una etapa posterior.

## Mensaje final

Esta no es solo una app academica. Es un prototipo cloud-native con practicas DevOps, preparado para mostrar como se prueba, empaqueta, despliega, protege y observa un sistema academico moderno.
