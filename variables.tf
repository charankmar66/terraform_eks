variable "aws_region" {
  description = "AWS region where the EKS cluster will be created."
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "kubernetes_version" {
  description = "Kubernetes minor version supported by EKS in the selected region."
  type        = string
  default     = "1.35"
}

variable "cluster_name_prefix" {
  description = "Prefix used to create a unique EKS cluster name."
  type        = string
  default     = "terraform-eks-poc"
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 3
}
