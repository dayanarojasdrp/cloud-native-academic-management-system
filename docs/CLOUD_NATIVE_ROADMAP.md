# Roadmap cloud-native

## Vision

El roadmap organiza la evolucion del sistema academico desde una aplicacion funcional hacia una plataforma cloud-native operable, observable y preparada para crecimiento institucional.

## Fases

| Fase | Objetivo | Entregables | Estado |
| --- | --- | --- | --- |
| Fase 1: aplicacion funcional | Construir las funcionalidades academicas base | Backend Laravel, frontend Vue, autenticacion, modulos academicos | Existente |
| Fase 2: preparacion para produccion local | Mejorar configuracion, pruebas y estabilidad local | Variables, pruebas, ajustes de entorno, estructura por capas | En progreso |
| Fase 3: integracion DevOps | Automatizar calidad, pruebas, builds y demo integrada | GitHub Actions, Dockerfiles, Docker Compose, documentacion cloud-native | Completada como baseline |
| Fase 4: despliegue cloud-native | Demostrar ejecucion en arquitectura moderna | Kubernetes manifests, ingress, HPA, rolling updates, Terraform baseline | Completada como baseline |
| Fase 5: observabilidad, seguridad y madurez | Medir, proteger y documentar la operacion | Prometheus, Grafana, alertas, security notes, CI/CD docs, contexto de investigacion | Actual |

## Fase 1: aplicacion funcional

**Objetivo:** disponer de una aplicacion academica con modulos principales.

**Entregables:** API Laravel, interfaz Vue, gestion de estudiantes, matriculas, pagos, notas, certificados, roles y autenticacion.

**Estado:** existente en repositorios separados.

## Fase 2: preparacion para produccion local

**Objetivo:** estabilizar configuracion, dependencias y convenciones de ejecucion.

**Entregables:** archivos `.env.example`, scripts de prueba, endpoint de health check, validacion de migraciones y configuracion de CORS/Sanctum.

**Estado:** en progreso y dependiente de ajustes dentro de los repositorios backend/frontend.

## Fase 3: integracion DevOps

**Objetivo:** convertir el sistema en una solucion automatizada y empaquetable.

**Entregables:** workflows CI, Docker Compose, Dockerfiles, documentacion de despliegue, variables y decisiones.

**Estado:** completada como baseline inicial.

## Fase 4: despliegue cloud-native

**Objetivo:** demostrar que backend, frontend y servicios auxiliares pueden vivir en un modelo cloud-native.

**Entregables:** manifests Kubernetes, ingress, configmaps, secrets de ejemplo, HPA, rolling updates, namespace, PostgreSQL de laboratorio con PVC y baseline Terraform para AWS.

**Estado:** completada como baseline. Requiere imagenes publicadas, secrets reales, ingress controller, cluster de prueba y presupuesto aprobado antes de cualquier aplicacion real.

## Fase 5: observabilidad, seguridad y madurez

**Objetivo:** que el prototipo se vea como un sistema cloud-native serio, no solo como una aplicacion desplegable.

**Entregables:** baseline Prometheus/Grafana, dashboard de salud de API, alertas simples, controles de secretos, network policies, rate limiting inicial, documentacion de seguridad, CI/CD y contexto de investigacion.

**Estado:** baseline implementado. Quedan pendientes instrumentacion real de metricas de negocio, logs centralizados, Alertmanager y validacion en cluster.
