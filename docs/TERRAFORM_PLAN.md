# Plan Terraform

## Objetivo

Definir la estrategia de infraestructura como codigo para desplegar el sistema academico en AWS. Esta fase incluye un baseline Terraform revisable, pero no ejecuta recursos cloud ni debe generar costos.

## Proveedor objetivo

AWS se considera como proveedor inicial por su madurez en servicios administrados, redes, IAM, bases de datos y Kubernetes gestionado.

## Componentes propuestos

### VPC

Crear una VPC dedicada para el sistema academico, con rango CIDR definido y separacion entre recursos publicos y privados.

### Subnets publicas y privadas

- Subnets publicas para balanceadores e ingress.
- Subnets privadas para workloads, base de datos y servicios internos.
- Distribucion en multiples zonas de disponibilidad cuando el presupuesto lo permita.

### Security groups

Definir reglas de minimo privilegio:

- Entrada HTTP/HTTPS hacia balanceador.
- Trafico interno desde frontend/proxy hacia backend.
- Acceso restringido desde backend hacia base de datos.
- Sin exposicion publica directa de base de datos.

### Base de datos gestionada

Se recomienda Amazon RDS PostgreSQL o MySQL como base gestionada para produccion.

Beneficios:

- Backups administrados.
- Alta disponibilidad opcional.
- Patching controlado.
- Menor carga operativa.

### Cluster Kubernetes futuro

Amazon EKS puede ser el objetivo para ejecutar frontend, backend y componentes de observabilidad.

Recursos asociados:

- Cluster EKS.
- Node groups o Fargate profiles.
- IAM roles for service accounts.
- Add-ons de red, DNS e ingress.

### IAM con least privilege

Los permisos deben limitarse por rol y funcion:

- Rol CI/CD para publicar imagenes y desplegar.
- Rol de cluster para operar recursos Kubernetes.
- Roles de aplicacion con acceso minimo a secretos o servicios necesarios.

## Costos y precauciones

Esta etapa no debe crear infraestructura real. Antes de ejecutar Terraform se recomienda:

- Estimar costos con AWS Pricing Calculator.
- Definir presupuesto mensual maximo.
- Activar alertas de billing.
- Usar ambientes temporales para pruebas.
- Destruir recursos no utilizados.
- Evitar NAT Gateways o servicios administrados costosos si no son necesarios para la demostracion.

## Estructura incluida

```text
terraform/
├── environments/
│   └── dev/
├── modules/
│   ├── network/
│   ├── security/
│   ├── storage/
│   ├── eks/
│   └── iam/
└── README.md
```

## Criterio de entrada para implementar

Terraform deberia ejecutarse cuando:

- La arquitectura Kubernetes este validada.
- Las imagenes Docker se publiquen en un registry.
- Exista una estrategia de ambientes.
- Se hayan definido presupuesto, region, dominios y modelo de seguridad.
