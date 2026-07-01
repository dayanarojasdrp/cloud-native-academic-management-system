# Decisiones tecnicas

Este documento registra decisiones relevantes para mantener trazabilidad tecnica y justificar la evolucion cloud-native del sistema.

## ADR-001: Separar frontend y backend en repositorios distintos

**Decision:** mantener el frontend Vue.js y el backend Laravel en repositorios independientes.

**Justificacion:** la separacion permite ciclos de desarrollo, pruebas y despliegue independientes. Tambien facilita que cada capa evolucione con su propio pipeline y equipo responsable.

**Impacto:** el repositorio DevOps debe actuar como punto de integracion y documentacion transversal.

## ADR-002: Usar Laravel para la API academica

**Decision:** implementar la logica de negocio en una API Laravel.

**Justificacion:** Laravel ofrece productividad, estructura MVC, migraciones, autenticacion con Sanctum y un ecosistema maduro para aplicaciones transaccionales.

**Impacto:** los pipelines backend deben contemplar Composer, PHPUnit, migraciones y herramientas de estilo como Laravel Pint.

## ADR-003: Usar Vue.js para el frontend

**Decision:** utilizar Vue.js como tecnologia de interfaz.

**Justificacion:** Vue permite desarrollar interfaces reactivas, modulares y mantenibles para flujos administrativos academicos.

**Impacto:** los pipelines frontend deben validar instalacion de dependencias, lint y build.

## ADR-004: Usar Docker Compose para entorno reproducible

**Decision:** preparar un entorno local integrado con Docker Compose.

**Justificacion:** Docker Compose reduce diferencias entre maquinas de desarrollo y permite demostrar la integracion entre servicios sin provisionar nube.

**Impacto:** se definen servicios para backend, frontend, base de datos y proxy opcional.

## ADR-005: Usar GitHub Actions para integracion continua

**Decision:** incorporar workflows de CI para backend, frontend y construccion de imagenes Docker.

**Justificacion:** GitHub Actions permite automatizar validaciones en cada cambio y eleva la calidad percibida del proyecto.

**Impacto:** se requiere mantener scripts de prueba, lint y build en los repositorios de aplicacion.

## ADR-006: Planificar Kubernetes para fases posteriores

**Decision:** no implementar Kubernetes en esta fase, pero documentar su diseno objetivo.

**Justificacion:** Kubernetes debe introducirse cuando la aplicacion tenga imagenes estables, health checks y configuracion externalizada.

**Impacto:** esta fase prepara los conceptos de deployments, services, ingress, secrets, configmaps y autoscaling.

## ADR-007: Planificar Terraform sin ejecutar recursos cloud

**Decision:** documentar Terraform como camino de infraestructura como codigo, sin aplicar recursos reales todavia.

**Justificacion:** evita costos prematuros y reduce riesgo operativo mientras se consolida el diseno.

**Impacto:** el plan se enfoca en AWS, VPC, subnets, seguridad, base gestionada y cluster Kubernetes futuro.

## ADR-008: Incorporar observabilidad en fase posterior

**Decision:** planificar metricas, logs, health checks y alertas antes de instrumentar.

**Justificacion:** la observabilidad debe alinearse con indicadores tecnicos y academicos relevantes.

**Impacto:** se documentan metricas como disponibilidad de API, errores 5xx, tiempo de respuesta, matriculas procesadas, pagos validados y certificados generados.
