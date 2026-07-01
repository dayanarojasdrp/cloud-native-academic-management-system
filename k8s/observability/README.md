# Observability baseline

This folder contains a small observability stack for a lab Kubernetes cluster.

It is intentionally scoped: Prometheus uses Blackbox Exporter to probe the Laravel health endpoint, and Grafana provisions a basic API health dashboard. It is not a replacement for a production monitoring platform.

## Before applying

- Confirm the application manifests are deployed.
- Confirm the backend exposes `/api/health`.
- Create the Grafana admin secret from the example file.
- Install metrics-server separately if HPA behavior must be tested.

## Create Grafana secret

```bash
cp k8s/observability/grafana-secret.example.yaml /tmp/grafana-secret.yaml
kubectl apply -f k8s/observability/namespace.yaml
kubectl apply -f /tmp/grafana-secret.yaml
```

## Apply observability stack

```bash
kubectl apply -k k8s/observability
```

## Local access

```bash
kubectl -n academic-observability port-forward svc/prometheus 9090:9090
kubectl -n academic-observability port-forward svc/grafana 3000:3000
```

## Known limitations

- Alerts are evaluated by Prometheus but no Alertmanager route is configured yet.
- Dashboard coverage is intentionally minimal.
- Logs are documented as a maturity target, but no log collector is deployed in this baseline.
