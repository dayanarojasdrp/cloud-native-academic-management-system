# Proximos pasos

## Objetivo

Este documento organiza el trabajo posterior a la Fase 3 para convertir la base DevOps actual en una migracion cloud-native progresiva y defendible academicamente.

## Prioridad 1: fortalecer backend y frontend

- Implementar o confirmar el endpoint `/api/health` en Laravel.
- Verificar pruebas automatizadas en backend.
- Confirmar scripts `lint`, `test` y `build` en frontend.
- Alinear variables CORS y Sanctum para el modo gateway.
- Crear CI nativo dentro de `academic-management-api`.
- Crear CI nativo dentro de `academic-management-web`.

## Prioridad 2: validar contenedores

- Ejecutar `docker compose up --build` en entorno local.
- Validar navegacion SPA con rutas internas como `/dashboard`, `/students` y `/enrollments`.
- Verificar conectividad entre frontend, backend y PostgreSQL.
- Documentar resultados de pruebas de humo.
- Definir estrategia productiva para backend con PHP-FPM y Nginx u otro runtime robusto.

## Prioridad 3: validar despliegue cloud-native

- Probar los manifests Kubernetes en kind, minikube o un cluster administrado de laboratorio.
- Reemplazar imagenes `latest` por tags versionados.
- Crear secrets reales fuera del repositorio.
- Preparar estrategia de migraciones Laravel en Kubernetes.
- Definir registry de imagenes.
- Definir ambientes `dev`, `staging` y `production`.

## Prioridad 4: infraestructura como codigo

- Definir region AWS objetivo.
- Estimar costos antes de ejecutar recursos.
- Revisar los modulos Terraform incluidos antes de cualquier ejecucion real.
- Incluir alertas de billing antes de pruebas reales.

## Prioridad 5: observabilidad y seguridad

- Instrumentar metricas tecnicas y academicas.
- Centralizar logs sin exponer datos sensibles.
- Definir dashboards para disponibilidad, errores, latencia y procesos academicos.
- Incorporar revision de dependencias y escaneo de imagenes.
- Documentar riesgos y controles de seguridad.

## Resultado esperado

Al completar estos pasos, el proyecto podra presentarse no solo como una aplicacion academica, sino como un caso de modernizacion progresiva hacia arquitectura cloud-native con evidencias tecnicas verificables.
