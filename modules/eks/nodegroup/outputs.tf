output "aws_eks_node_group_id" {
  value = aws_eks_node_group.this.id
}

output "aws_iam_role_arn" {
  value = aws_iam_role.eks_nodegroup_role.arn
}