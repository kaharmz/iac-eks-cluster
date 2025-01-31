module "iam_eks" {
  source = "/home/kahar/Documents/iac/aws/eks/modules/aws-iam"

  cluster_role_name = "dev-eks-cluster-role"
  node_role_name    = "dev-eks-node-role"

  cluster_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  ]

  node_policies = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.33.1"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnets_ids

  cluster_endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  # Use IAM Role ARN from the iam_eks module
  iam_role_arn = module.iam_eks.eks_cluster_role_arn  # ARN of Cluster Role

  eks_managed_node_groups = {
    dev-nodes = {
      ami_type       = "AL2_x86_64"
      instance_types = ["t3.medium"]

      min_size     = 2
      max_size     = 2
      desired_size = 2
      capacity_type  = "ON_DEMAND"

      # Use IAM Role ARN from the iam_eks module for Node Role
      iam_role_arn = module.iam_eks.eks_node_role_arn  # ARN of Node Role
    }
  }

  tags = {
    Environment = var.cluster_name
    Project     = "eks-dev-test"
    Owner       = "kahar"
  }
}



