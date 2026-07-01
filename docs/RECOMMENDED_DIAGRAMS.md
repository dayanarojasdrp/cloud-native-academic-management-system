# Diagramas recomendados

## Proposito

Este repositorio no incluye diagramas implementados en esta fase. En su lugar, documenta que diagramas conviene preparar para una presentacion profesional, una defensa de maestria o una etapa posterior de arquitectura.

No existe una ley universal que obligue a un proyecto de software academico a tener un conjunto especifico de diagramas. Profesionalmente, lo recomendable es documentar vistas arquitectonicas que respondan a stakeholders concretos, decisiones tecnicas y riesgos operativos.

## Base profesional consultada

- ISO/IEC/IEEE 42010:2022 define requisitos para la estructura y expresion de una descripcion de arquitectura, incluyendo conceptos como stakeholders, concerns, viewpoints, views y model kinds.
- IEEE/ISO/IEC 42010:2022 refuerza que una descripcion de arquitectura debe capturar conceptos, relaciones y puntos de vista utiles para comunicar y revisar una arquitectura.
- El modelo C4 propone diagramas jerarquicos de contexto, contenedores, componentes y codigo, junto con diagramas complementarios como landscape, dynamic y deployment.
- NIST SP 800-218 SSDF recomienda integrar practicas de seguridad durante el ciclo de vida del desarrollo; por eso conviene incluir vistas de seguridad, amenazas y controles.

## Diagramas que deberias preparar

| Diagrama | Que debe representar | Por que importa |
| --- | --- | --- |
| Contexto del sistema | Usuarios academicos, sistema de gestion academica, repositorios backend/frontend/DevOps y sistemas externos futuros | Explica el alcance del proyecto a jurado, docentes y stakeholders no tecnicos |
| Contenedores C4 | Frontend Vue, API Laravel, base de datos, gateway Nginx, pipelines CI y registry futuro | Muestra la separacion tecnica entre aplicaciones, datos e infraestructura |
| Componentes backend | Modulos Laravel: estudiantes, matricula, pagos, asignaturas, notas, certificados, roles, permisos, reportes y autenticacion | Conecta la arquitectura tecnica con el dominio academico |
| Flujo DevOps | Commit, GitHub Actions, pruebas, lint, build Docker, validacion integrada y publicacion futura | Demuestra que la propuesta no es solo desarrollo, sino automatizacion de calidad |
| Despliegue local | Docker Compose con backend, frontend, PostgreSQL y Nginx | Explica como se reproduce el sistema en una demo local |
| Despliegue Kubernetes futuro | Namespace, deployments, services, ingress, configmaps, secrets, HPA y base gestionada | Prepara la defensa de la migracion cloud-native sin implementarla todavia |
| Infraestructura AWS futura | VPC, subnets publicas/privadas, security groups, RDS, EKS e IAM | Justifica el plan Terraform y la separacion de red/seguridad |
| Observabilidad | Prometheus, Grafana, health checks, logs, alertas y metricas academicas | Muestra como se operaria el sistema despues de migrar a nube |
| Seguridad y amenazas | Actores, superficies de ataque, secretos, autenticacion, base de datos, CI/CD y controles | Da soporte al componente de seguridad exigido en proyectos cloud |
| Secuencia de autenticacion | Login, Sanctum, sesion/token, frontend, API y validacion de permisos | Aclara un flujo critico de seguridad y experiencia de usuario |
| Secuencia de matricula | Usuario, frontend, API, validaciones, base de datos y respuesta | Representa un proceso academico central de la investigacion |
| Modelo de datos conceptual | Entidades academicas principales y relaciones: estudiante, matricula, pago, asignatura, nota, certificado, usuario, rol | Ayuda a explicar consistencia, trazabilidad y dominio institucional |

## Recomendacion para la defensa

Para una presentacion de maestria, prioriza cinco diagramas:

1. Contexto del sistema.
2. Contenedores C4.
3. Flujo DevOps.
4. Despliegue Kubernetes futuro.
5. Observabilidad y seguridad.

Con esos cinco diagramas puedes explicar problema, solucion, automatizacion, migracion cloud y operacion futura sin sobrecargar la defensa.

## Fuentes

- ISO: https://www.iso.org/standard/74393.html
- IEEE: https://standards.ieee.org/ieee/42010/6846/
- C4 model: https://c4model.com/
- NIST SSDF: https://csrc.nist.gov/pubs/sp/800/218/final
