resource "aws_eks_fargate_profile" "this" {
  count = length(var.profile_names) > 0 ? length(var.profile_names): 0
  depends_on = [ aws_iam_role.eks_fargate_role, aws_iam_policy_attachment.eks_AmazonEKSWorkerNodePolicy ]
  cluster_name = "${var.cluster_name}"
  fargate_profile_name = "${var.profile_names[count.index]}-fg-profile"
  pod_execution_role_arn = aws_iam_role.eks_fargate_role.arn
  subnet_ids = var.subnet_ids
  selector {
    namespace = var.profile_names[count.index]
  }
}