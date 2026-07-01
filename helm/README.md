# Helm chart staging area

Helm is not implemented in this phase.

The directories below are reserved for a later refactor once the Kubernetes manifests have been tested in a lab cluster:

```text
helm/
├── academic-management-api/
└── academic-management-web/
```

Recommended next step: convert the stable Kubernetes manifests into charts only after image tags, secrets strategy, ingress hostnames and environment values are agreed.
