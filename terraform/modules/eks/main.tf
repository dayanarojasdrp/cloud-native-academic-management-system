resource "aws_eks_cluster" "this" {
  name     = "${var.project_name}-${var.environment}"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
  }
}
