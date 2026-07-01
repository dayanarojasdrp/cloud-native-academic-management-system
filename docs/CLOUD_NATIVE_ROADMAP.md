# Roadmap cloud-native

## Vision

El roadmap organiza la evolucion del sistema academico desde una aplicacion funcional hacia una plataforma cloud-native operable, observable y preparada para crecimiento institucional.

## Fases

| Fase | Objetivo | Entregables | Estado |
| --- | --- | --- | --- |
| Fase 1: aplicacion funcional | Construir las funcionalidades academicas base | Backend Laravel, frontend Vue, autenticacion, modulos academicos | Existente |
| Fase 2: preparacion para produccion local | Mejorar configuracion, pruebas y estabilidad local | Variables, pruebas, ajustes de entorno, estructura por capas | En progreso |
| Fase 3: integracion DevOps | Automatizar calidad, pruebas, builds y demo integrada | GitHub Actions, Dockerfiles, Docker Compose, documentacion cloud-native | Actual |
| Fase 4: despliegue Kubernetes | Orquestar servicios en cluster | Manifests, namespaces, deployments, services, ingress, HPA | Planificado |
| Fase 5: infraestructura como codigo con Terraform | Provisionar infraestructura reproducible | VPC, subnets, base gestionada, cluster, IAM | Planificado |
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

**Estado:** fase actual.

## Fase 4: despliegue Kubernetes

**Objetivo:** ejecutar backend, frontend y servicios auxiliares en un cluster.

**Entregables:** manifests Kubernetes, ingress, configmaps, secrets, HPA, rolling updates y estrategia de namespaces.

**Estado:** planificado.

## Fase 5: infraestructura como codigo con Terraform

**Objetivo:** provisionar recursos cloud de forma versionada y controlada.

**Entregables:** modulos Terraform para red, seguridad, base gestionada, cluster Kubernetes y permisos IAM.

**Estado:** planificado sin ejecucion para evitar costos prematuros.

## Fase 6: observabilidad y seguridad

**Objetivo:** operar el sistema con indicadores tecnicos y academicos.

**Entregables:** metricas, dashboards, logs centralizados, alertas, auditoria, gestion de secretos y politicas de seguridad.

**Estado:** planificado.
