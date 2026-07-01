# Fase 4: despliegue cloud-native

## Mensaje de la fase

Esta aplicacion esta disenada para escalar y desplegarse en infraestructura cloud moderna.

La Fase 4 no pretende declarar produccion lista. Su objetivo es demostrar que el sistema academico ya tiene una base clara para ejecutarse fuera del entorno local: namespace aislado, servicios desacoplados, configuracion externalizada, escalado horizontal basico, estrategia de rolling updates y una ruta inicial hacia AWS con Terraform.

## Alcance implementado

| Area | Estado |
| --- | --- |
| Namespace Kubernetes | Incluido |
| Backend Deployment y Service | Incluido |
| Frontend Deployment y Service | Incluido |
| Ingress | Incluido para `academic.local` |
| ConfigMaps | Incluidos para backend y frontend |
| Secrets | Incluidos como plantillas `.example.yaml` |
| PostgreSQL local/lab con PVC | Incluido en overlay `lab-postgres` |
| HPA basico | Incluido para backend y frontend |
| Rolling updates | Configurados en deployments |
| Helm | Estructura reservada, no implementada |
| Terraform AWS | Baseline modular incluido, no aplicado |

## Kubernetes

Los manifiestos viven en [../k8s](../k8s). La estructura separa la aplicacion base del PostgreSQL de laboratorio:

```text
k8s/
├── base/
└── lab-postgres/
```

Aplicacion con base de datos gestionada o externa:

```bash
cp k8s/base/backend-secret.example.yaml /tmp/backend-secret.yaml
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -f /tmp/backend-secret.yaml
kubectl apply -k k8s/base
```

Aplicacion con PostgreSQL local de laboratorio:

```bash
cp k8s/base/backend-secret.example.yaml /tmp/backend-secret.yaml
cp k8s/lab-postgres/postgres-secret.example.yaml /tmp/postgres-secret.yaml
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -f /tmp/backend-secret.yaml
kubectl apply -f /tmp/postgres-secret.yaml
kubectl apply -k k8s/lab-postgres
```

Verificacion:

```bash
kubectl -n academic-management get pods
kubectl -n academic-management get svc
kubectl -n academic-management get ingress
kubectl -n academic-management rollout status deployment/academic-backend
kubectl -n academic-management rollout status deployment/academic-frontend
```

## Terraform

La base Terraform vive en [../terraform](../terraform). Incluye:

- VPC.
- Subnets publicas y privadas.
- Security groups por entrada publica, workloads y base de datos.
- S3 privado y versionado para assets/backups.
- IAM basico para EKS.
- EKS opcional, desactivado por defecto con `create_eks = false`.

Validacion recomendada:

```bash
cd terraform/environments/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

No ejecutes `terraform apply` hasta tener cuenta AWS, presupuesto, region, estrategia de estado remoto y decision formal sobre EKS/RDS.

## Trabajo que queda para DevOps

- Construir y publicar imagenes versionadas en un registry.
- Reemplazar tags `latest` por SHA o version.
- Crear secrets reales fuera del repositorio.
- Confirmar health check `/api/health`.
- Instalar ingress controller y metrics-server en el cluster.
- Definir TLS, DNS, backups y politicas de red.
- Convertir los manifests a Helm solo cuando el baseline haya sido probado.
