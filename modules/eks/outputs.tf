output "aws_iam_openid_connect_provider_arn" {
  value = module.oidc_provider.aws_iam_openid_connect_provider_arn
}

output "aws_iam_openid_connect_provider_extracted_arn" {
  value = module.oidc_provider.aws_iam_openid_connect_provider_extracted_arn
}

output "aws_iam_role_arn" {
  value = module.nodegroup.aws_iam_role_arn
}