
output  "lbc_iam_policy_arn" {
  value = aws_iam_policy.this.arn
}

output "lbc_iam_role_arn" {
  value = aws_iam_role.this.arn
}

output "lbc_helm_metadata" {
  value = helm_release.loadbalancer_controller.metadata
}