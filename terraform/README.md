# Terraform baseline

This folder defines the first infrastructure-as-code baseline for a future AWS deployment.

It is not meant to be applied blindly. The goal is to document and prepare the infrastructure shape: VPC, public and private subnets, security groups, S3 storage, IAM and an optional EKS foundation.

## Current position

- The project is ready to discuss AWS architecture.
- The Terraform files are a starting point for review.
- Expensive resources are guarded by variables where possible.
- Real execution requires budget approval, AWS account access and final naming decisions.

## Suggested workflow

```bash
cd terraform/environments/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

Do not run `terraform apply` until cost, region, domain, database and cluster decisions are approved.

## Production work left for the DevOps owner

- Confirm AWS region and account.
- Decide whether EKS is required for the first demo or if a local cluster is enough.
- Decide database strategy: RDS PostgreSQL is recommended for production.
- Configure remote state, ideally S3 with DynamoDB locking.
- Add tagging policy, budget alarms and access boundaries.
- Review security groups against the real ingress/load balancer design.
