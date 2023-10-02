output "eks_readonly_role_arn" {
  value = aws_iam_role.this.arn
}

output "eks_cluster_role_subject_name" {
  value = kubernetes_cluster_role_binding.this.subject[0].name
}