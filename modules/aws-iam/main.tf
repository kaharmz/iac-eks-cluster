resource "aws_iam_role" "eks_cluster_role" {
  name               = var.cluster_role_name
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policies" {
  for_each   = toset(var.cluster_policies)
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = each.value
}

resource "aws_iam_role" "eks_node_role" {
  name               = var.node_role_name
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role_policy_node.json
}

resource "aws_iam_role_policy_attachment" "eks_node_policies" {
  for_each   = toset(var.node_policies)
  role       = aws_iam_role.eks_node_role.name
  policy_arn = each.value
}

# Define Assume Role Policy for EKS Cluster
data "aws_iam_policy_document" "eks_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
    effect = "Allow"
  }
}

# Define Assume Role Policy for EKS Worker Nodes
data "aws_iam_policy_document" "eks_assume_role_policy_node" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}
