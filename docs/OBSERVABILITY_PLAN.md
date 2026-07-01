# Plan de observabilidad

## Objetivo

Definir una estrategia de observabilidad para operar el sistema academico con visibilidad tecnica y funcional. El repositorio ya incluye un baseline de laboratorio con Prometheus, Blackbox Exporter y Grafana; la instrumentacion completa de metricas de aplicacion y logs queda para la siguiente iteracion.

## Componentes propuestos

| Componente | Funcion |
| --- | --- |
| Prometheus | Recoleccion de metricas |
| Blackbox Exporter | Verificacion HTTP de `/api/health` |
| Grafana | Dashboards tecnicos y academicos |
| Logs centralizados | Analisis de errores y auditoria |
| Health checks | Verificacion automatica de disponibilidad |
| Alertas | Notificacion temprana de incidentes |

## Metricas tecnicas

- Disponibilidad de API.
- Porcentaje de errores 5xx.
- Tiempo de respuesta por endpoint.
- Latencia de base de datos.
- Uso de CPU y memoria por servicio.
- Reinicios de contenedores.
- Saturacion de conexiones.

## Metricas academicas

- Matriculas procesadas.
- Certificados generados.
- Pagos validados.
- Fallos de autenticacion.
- Solicitudes de reportes academicos.
- Volumen de consultas por modulo.

Estas metricas permiten conectar la investigacion tecnica con impacto institucional: no solo se observa infraestructura, tambien se mide la continuidad de procesos academicos relevantes.

## Health checks

Endpoint recomendado:

```text
/api/health
```

Debe responder de forma rapida e indicar:

- Estado general de la API.
- Conexion a base de datos.
- Version de aplicacion si aplica.
- Timestamp de respuesta.

## Logs

Los logs deben permitir trazabilidad sin exponer datos sensibles:

- Errores de aplicacion.
- Intentos fallidos de autenticacion.
- Operaciones administrativas relevantes.
- Fallos de integracion.
- Eventos de jobs o tareas programadas.

## Alertas futuras

Alertas recomendadas:

- API no disponible.
- Errores 5xx por encima del umbral.
- Tiempo de respuesta elevado.
- Base de datos inaccesible.
- Aumento anormal de fallos de autenticacion.
- Caida en procesos criticos como matriculas o pagos.

## Dashboards iniciales

Dashboards sugeridos:

- Estado general del sistema.
- Rendimiento de API.
- Salud de base de datos.
- Actividad academica.
- Seguridad y autenticacion.

## Criterio de entrada para implementar

Antes de implementar observabilidad se recomienda:

- Definir endpoints criticos.
- Incorporar `/api/health`.
- Estabilizar despliegue Docker/Kubernetes.
- Definir metricas de negocio con actores academicos.
- Acordar politicas de privacidad y retencion de logs.
