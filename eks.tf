resource "aws_eks_cluster" "this" {
  name = "${local.name}-eks-cluster"

  role_arn                  = aws_iam_role.cluster.name
  enabled_cluster_log_types = var.enabled_cluster_log_types
  version                   = var.k8s_version

  dynamic "encryption_config" {
    for_each = var.enable_k8s_secrets_encryption ? ["dummy-value"] : []

    content {
      provider {
        key_arn = var.k8s_secrets_encryption_kms_arn
      }

      resources = ["secrets"]
    }
  }

  vpc_config {
    endpoint_private_access = var.enable_eks_private_access
    endpoint_public_access  = var.enable_eks_public_access
    public_access_cidrs     = var.eks_public_access_allowed_cidrs
    security_group_ids      = [aws_security_group.cluster.id]
    subnet_ids              = var.eks_subnet_ids
  }

  tags = local.common_tags
}