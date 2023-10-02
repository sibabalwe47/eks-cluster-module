output "aws_iam_openid_connect_provider_arn" {
  value = module.oidc_provider.aws_iam_openid_connect_provider_arn
}

output "aws_iam_openid_connect_provider_extracted_arn" {
  value = module.oidc_provider.aws_iam_openid_connect_provider_extracted_arn
}

output "aws_iam_role_arn" {
  value = module.nodegroup.aws_iam_role_arn
}

output "eks_readonly_role_arn" {
  value = module.rbac.eks_readonly_role_arn
}

output "eks_cluster_role_subject_name" {
  value = module.rbac.eks_cluster_role_subject_name
}