# Limitaciones actuales

## Proposito

Este documento declara los limites conscientes de la Fase 3. En un proyecto academico y profesional, explicitar limitaciones no debilita la propuesta; demuestra criterio de alcance, madurez tecnica y control de riesgos.

## Limitaciones de implementacion

- Kubernetes manifests are included as a lab baseline, not as a hardened production release.
- Terraform modules are included but not executed.
- Observability stack is planned but not instrumented.
- Docker Compose is intended for local integration only.
- Production deployment requires additional hardening.

## Limitaciones DevOps

- Los workflows de GitHub Actions se ejecutan desde el repositorio DevOps, por lo que validan la integracion central cuando cambia este repositorio.
- Los repositorios backend y frontend deberian tener sus propios pipelines en fases posteriores.
- La publicacion de imagenes Docker en GitHub Container Registry queda documentada pero desactivada.
- No existe todavia promocion automatizada entre ambientes como development, staging y production.

## Limitaciones de seguridad

- Los secretos reales no se gestionan todavia con un vault o secret manager.
- La configuracion productiva de TLS, headers HTTP, politicas CORS, rotacion de secretos y hardening de contenedores queda pendiente.
- La imagen backend actual usa `php artisan serve` para demo local, no para produccion.

## Limitaciones de arquitectura cloud

- No se ha definido todavia una topologia final de red cloud.
- No se han creado namespaces, ingress, HPA ni policies de Kubernetes.
- No se han estimado costos cloud definitivos.

## Valor academico

Estas limitaciones delimitan con claridad la frontera entre la preparacion DevOps actual y la migracion cloud-native futura, lo cual permite construir una investigacion por fases y medir la evolucion tecnica del sistema.
