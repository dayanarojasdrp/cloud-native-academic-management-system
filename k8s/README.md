# Kubernetes deployment baseline

This folder contains the first deployable Kubernetes baseline for the academic management system.

It is intentionally conservative: it is enough to demonstrate that the platform can run in a modern orchestration model, but it does not claim to be a finished production deployment.

## Structure

```text
k8s/
├── base/
│   ├── namespace.yaml
│   ├── backend-*.yaml
│   ├── frontend-*.yaml
│   ├── ingress.yaml
│   └── kustomization.yaml
└── lab-postgres/
    ├── postgres-*.yaml
    └── kustomization.yaml
```

## What is included

- Separate namespace: `academic-management`.
- Backend Deployment, Service, ConfigMap, Secret example, HPA and rolling update strategy.
- Frontend Deployment, Service, ConfigMap, HPA and rolling update strategy.
- Ingress routing `/api` to Laravel and `/` to Vue.
- Local/lab PostgreSQL manifests with PersistentVolumeClaim.

## What you must provide before applying

1. Build and publish the backend image.
2. Build and publish the frontend image.
3. Create real Kubernetes secrets from the example files.
4. Confirm that `/api/health` exists in the Laravel API.
5. Install an ingress controller if the cluster does not already have one.
6. Install metrics-server before relying on HPA.

## Create secrets

Do not apply the `*.example.yaml` files directly with real values committed to Git. Copy them locally, edit the values, and apply the local copy.

```bash
cp k8s/base/backend-secret.example.yaml /tmp/backend-secret.yaml
cp k8s/lab-postgres/postgres-secret.example.yaml /tmp/postgres-secret.yaml
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -f /tmp/backend-secret.yaml
kubectl apply -f /tmp/postgres-secret.yaml
```

For Laravel:

```bash
php artisan key:generate --show
```

## Apply application resources

Application only, assuming the database is managed elsewhere:

```bash
kubectl apply -k k8s/base
```

Application plus local PostgreSQL for lab:

```bash
kubectl apply -k k8s/lab-postgres
```

## Verify rollout

```bash
kubectl -n academic-management get pods
kubectl -n academic-management get svc
kubectl -n academic-management get ingress
kubectl -n academic-management rollout status deployment/academic-backend
kubectl -n academic-management rollout status deployment/academic-frontend
```

## Local host entry for lab ingress

For local clusters, point `academic.local` to the ingress address.

```bash
kubectl -n academic-management get ingress academic-management
```

Then configure your local host mapping according to the cluster tool you use.

## Known production gaps

- The backend image must be changed to a production runtime before real use.
- Secrets need a managed secret store or sealed-secret workflow.
- PostgreSQL should be replaced by a managed database for production.
- TLS, DNS, image scanning, backup policy and network policy are not implemented here.
