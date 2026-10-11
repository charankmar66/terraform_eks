module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.31.6"

  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Allows the IAM identity running Terraform to administer the cluster.
  enable_cluster_creator_admin_permissions = true

  # Keep the API endpoint reachable from your workstation for this learning POC.
  # For production, restrict public access to trusted IP CIDR ranges.
  cluster_endpoint_public_access = true

  enable_irsa = true

  eks_managed_node_group_defaults = {
    instance_types = var.node_instance_types
  }

  eks_managed_node_groups = {
    poc_nodes = {
      min_size     = var.min_size
      max_size     = var.max_size
      desired_size = var.desired_size
    }
  }

  tags = {
    Project   = "terraform-eks-poc"
    ManagedBy = "Terraform"
  }
}
