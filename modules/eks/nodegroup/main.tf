
resource "aws_eks_node_group" "this" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.eks_cluster_name}-eks-ng-public"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = var.public_subnets
  version         = var.eks_version
  ami_type        = var.ami_type
  capacity_type   = var.capacity_type
  disk_size       = 20
  instance_types  = var.instance_types
  scaling_config {
    desired_size = scaling_config.desired_size
    min_size     = scaling_config.min_size
    max_size     = scaling_config.max_size
  }
  update_config {
    max_unavailable = 1
  }
  depends_on = [
    aws_iam_policy_attachment.eks_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_policy_attachment.eks_AmazonEKSCNIPolicy,
    aws_iam_policy_attachment.eks_AmazonEKSWorkerNodePolicy,
  ]
}
