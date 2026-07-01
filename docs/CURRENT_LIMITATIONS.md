# Limitaciones actuales

## Proposito

Este documento declara los limites conscientes del prototipo cloud-native. En un proyecto academico y profesional, explicitar limitaciones no debilita la propuesta; demuestra criterio de alcance, madurez tecnica y control de riesgos.

## Limitaciones de implementacion

- Kubernetes manifests are included as a lab baseline, not as a hardened production release.
- Terraform modules are included but not executed.
- Observability stack is included as a lab baseline, but application metrics and centralized logs are not fully instrumented.
- Docker Compose is intended for local integration only.
- Production deployment requires additional hardening.

## Limitaciones DevOps

- Los workflows de GitHub Actions se ejecutan desde el repositorio DevOps, por lo que validan la integracion central cuando cambia este repositorio.
- Los repositorios backend y frontend deberian tener sus propios pipelines en fases posteriores.
- La publicacion de imagenes Docker en GitHub Container Registry queda documentada pero desactivada.
- No existe todavia promocion automatizada entre ambientes como development, staging y production.

## Limitaciones de seguridad

- Los secretos reales no se gestionan todavia con un vault o secret manager.
- La configuracion productiva de TLS, headers HTTP, politicas CORS por ambiente, rotacion de secretos y hardening de contenedores queda pendiente.
- La imagen backend actual usa `php artisan serve` para demo local, no para produccion.

## Limitaciones de arquitectura cloud

- La topologia final de red cloud aun debe revisarse antes de cualquier `terraform apply`.
- Los manifests de Kubernetes existen como baseline; falta validarlos en un cluster real con ingress controller, metrics-server y CNI compatible con NetworkPolicy.
- No se han estimado costos cloud definitivos.

## Limitaciones de observabilidad

- Prometheus, Blackbox Exporter y Grafana estan definidos como baseline de laboratorio.
- No hay Alertmanager configurado todavia.
- No hay collector de logs centralizados todavia.
- Las metricas academicas de negocio requieren instrumentacion en Laravel.

## Valor academico

Estas limitaciones delimitan con claridad la frontera entre el prototipo cloud-native actual y una operacion productiva, lo cual permite construir una investigacion por fases y medir la evolucion tecnica del sistema.
