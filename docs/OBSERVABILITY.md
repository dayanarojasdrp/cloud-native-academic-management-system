# Observabilidad

## Proposito

La observabilidad de este repositorio busca demostrar que el sistema academico no termina en el despliegue. Un sistema que gestiona matriculas, pagos, certificados y notas necesita visibilidad operativa: saber si la API responde, si los servicios se reinician, si los tiempos de respuesta se degradan y si los procesos academicos criticos mantienen continuidad.

## Alcance implementado

La Fase 5 incluye un baseline de laboratorio en [../k8s/observability](../k8s/observability):

- Prometheus para recoleccion de metricas y evaluacion de alertas.
- Blackbox Exporter para probar disponibilidad HTTP de `/api/health`.
- Grafana con datasource de Prometheus provisionado.
- Dashboard inicial de salud de API.
- Reglas simples para detectar API no disponible y reinicios repetidos del backend.
- Health checks documentados y utilizados por Kubernetes.

## Senales iniciales

| Senal | Estado |
| --- | --- |
| Disponibilidad de API | Preparada mediante Blackbox Exporter contra `/api/health` |
| Estado de pods | Observable si se despliegan metricas de cluster |
| Reinicios del backend | Regla Prometheus incluida |
| Dashboard API | Dashboard Grafana inicial incluido |
| Logs centralizados | Pendiente |
| Alertmanager | Pendiente |

## Comandos de laboratorio

Crear secret local de Grafana:

```bash
cp k8s/observability/grafana-secret.example.yaml /tmp/grafana-secret.yaml
kubectl apply -f k8s/observability/namespace.yaml
kubectl apply -f /tmp/grafana-secret.yaml
```

Aplicar stack:

```bash
kubectl apply -k k8s/observability
```

Acceso local:

```bash
kubectl -n academic-observability port-forward svc/prometheus 9090:9090
kubectl -n academic-observability port-forward svc/grafana 3000:3000
```

## Metricas academicas recomendadas

Estas metricas deben instrumentarse en el backend cuando el dominio este estable:

- Matriculas procesadas.
- Certificados generados.
- Pagos validados.
- Fallos de autenticacion.
- Solicitudes de reportes academicos.
- Errores por modulo academico.

## Trabajo pendiente

- Implementar endpoint `/metrics` en Laravel o integrar un exporter compatible.
- Agregar Alertmanager y canales de notificacion.
- Incorporar logs centralizados con Loki, OpenSearch u otra alternativa.
- Ampliar dashboard con latencia, errores 5xx y uso por modulo.
- Definir politicas de retencion de metricas y logs.
