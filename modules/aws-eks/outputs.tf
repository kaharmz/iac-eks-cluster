output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_cluster_role_arn" {
  description = "ARN of the EKS Cluster IAM Role"
  value       = module.iam_eks.eks_cluster_role_arn
}

output "eks_node_role_arn" {
  description = "ARN of the EKS Node IAM Role"
  value       = module.iam_eks.eks_node_role_arn
}
