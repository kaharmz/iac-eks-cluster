variable "cluster_role_name" {
  description = "Name of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_name" {
  description = "Name of the IAM role for the EKS worker nodes"
  type        = string
}

variable "cluster_policies" {
  description = "List of policies to attach to the EKS cluster role"
  type        = list(string)
}

variable "node_policies" {
  description = "List of policies to attach to the EKS node role"
  type        = list(string)
}
