# Roadmap cloud-native

## Vision

El roadmap organiza la evolucion del sistema academico desde una aplicacion funcional hacia una plataforma cloud-native operable, observable y preparada para crecimiento institucional.

## Fases

| Fase | Objetivo | Entregables | Estado |
| --- | --- | --- | --- |
| Fase 1: aplicacion funcional | Construir las funcionalidades academicas base | Backend Laravel, frontend Vue, autenticacion, modulos academicos | Existente |
| Fase 2: preparacion para produccion local | Mejorar configuracion, pruebas y estabilidad local | Variables, pruebas, ajustes de entorno, estructura por capas | En progreso |
| Fase 3: integracion DevOps | Automatizar calidad, pruebas, builds y demo integrada | GitHub Actions, Dockerfiles, Docker Compose, documentacion cloud-native | Completada como baseline |
| Fase 4: despliegue cloud-native | Demostrar ejecucion en arquitectura moderna | Kubernetes manifests, ingress, HPA, rolling updates, Terraform baseline | Actual |
| Fase 5: infraestructura como codigo con Terraform | Provisionar infraestructura reproducible | VPC, subnets, base gestionada, cluster, IAM | Baseline incluido, ejecucion pendiente |
| Fase 6: observabilidad y seguridad | Medir, alertar y fortalecer operacion | Prometheus, Grafana, logs, alertas, hardening, politicas | Planificado |

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

**Estado:** fase actual con baseline implementado. Requiere imagenes publicadas, secrets reales, ingress controller y cluster de prueba para validacion completa.

## Fase 5: infraestructura como codigo con Terraform

**Objetivo:** provisionar recursos cloud de forma versionada y controlada.

**Entregables:** modulos Terraform para red, seguridad, base gestionada, cluster Kubernetes y permisos IAM.

**Estado:** baseline modular incluido. No debe ejecutarse sin aprobacion de presupuesto, region, cuenta AWS y estrategia de estado remoto.

## Fase 6: observabilidad y seguridad

**Objetivo:** operar el sistema con indicadores tecnicos y academicos.

**Entregables:** metricas, dashboards, logs centralizados, alertas, auditoria, gestion de secretos y politicas de seguridad.

**Estado:** planificado.
