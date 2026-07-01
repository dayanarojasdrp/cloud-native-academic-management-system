# Integracion DevOps

## Objetivo

La Fase 3 establece la base DevOps del sistema academico. Su objetivo es automatizar calidad, pruebas, builds y preparacion de despliegue, de modo que el proyecto deje de depender exclusivamente de ejecuciones manuales locales.

Esta fase representa el paso intermedio entre una aplicacion funcional y una plataforma cloud-native. No pretende completar la migracion a nube, sino crear los mecanismos que la hacen viable.

## Alcance

La integracion DevOps incluye:

- Workflows de GitHub Actions para backend, frontend y builds Docker.
- Dockerfiles de referencia para API Laravel y frontend Vue.
- Docker Compose para levantar una demo local integrada.
- Documentacion de despliegue, variables de entorno y problemas comunes.
- Planes de evolucion hacia Kubernetes, Terraform y observabilidad.

## Principios

| Principio | Aplicacion en el proyecto |
| --- | --- |
| Reproducibilidad | El entorno integrado puede levantarse con Docker Compose |
| Automatizacion | CI valida dependencias, pruebas, lint y builds |
| Separacion de capas | Backend, frontend y DevOps se mantienen en repos distintos |
| Evolucion incremental | Kubernetes y Terraform se planifican antes de ejecutarse |
| Seguridad | Los secretos reales no se versionan |
| Trazabilidad | Las decisiones tecnicas quedan documentadas |

## Pipelines

### Backend CI

Valida el repositorio Laravel mediante instalacion de dependencias, configuracion de entorno de prueba, migraciones SQLite, pruebas automatizadas y Laravel Pint cuando esta disponible.

### Frontend CI

Valida el repositorio Vue mediante instalacion de dependencias, lint si existe y build de produccion.

### Docker Build

Construye imagenes de backend y frontend desde los Dockerfiles del repositorio DevOps. Por defecto no publica imagenes; se deja preparado para una fase posterior con GitHub Container Registry.

## Resultado esperado

Al finalizar esta fase, el sistema puede presentarse como una aplicacion academica con una base de ingenieria cloud-native: versionable, documentada, automatizada y preparada para empaquetado y despliegue posterior.
