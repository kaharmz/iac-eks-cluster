output "eks_cluster_role_arn" {
  description = "ARN of the EKS Cluster IAM role"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  description = "ARN of the EKS Node IAM role"
  value       = aws_iam_role.eks_node_role.arn
}
