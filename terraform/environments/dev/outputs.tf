output "vpc_id" {
  description = "VPC created for the academic management platform."
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs for future load balancers."
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs for application workloads."
  value       = module.network.private_subnet_ids
}

output "assets_bucket_name" {
  description = "S3 bucket for future assets or backups."
  value       = module.storage.assets_bucket_name
}
