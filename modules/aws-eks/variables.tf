variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The EKS Kubernetes version"
  type        = string
}

variable "subnets_ids" {
  description = "The subnets in which the EKS cluster should be created"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID in which the EKS cluster should be created"
  type        = string
}


