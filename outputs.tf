output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for the EKS Kubernetes API."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group attached to the EKS control plane."
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region where the cluster was created."
  value       = var.aws_region
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN used for IAM Roles for Service Accounts."
  value       = module.eks.oidc_provider_arn
}

output "update_kubeconfig_command" {
  description = "Run this command to configure kubectl for the new cluster."
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.aws_region}"
}
