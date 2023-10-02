output "fargate_profile_arn" {
  value = aws_eks_fargate_profile.this[*].arn
}

output "fargate_profile_id" {
  value = aws_eks_fargate_profile.this[*].id
}

output "fargate_profile_status" {
  value = aws_eks_fargate_profile.this[*].status
}