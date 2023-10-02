resource "aws_iam_policy" "this" {
    name = "${var.eks_cluster_name}-AWSLoadBalancerControllerIAMPolicy"
    path = "/"
    description = "AWS Load Balancer Controller IAM Policy"
    policy = file("${path.module}/policy.json")
}

resource "aws_iam_role" "this" {
  name = "${var.eks_cluster_name}-lbc-iam-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.aws_iam_openid_connect_provider_arn}"
        }
        Condition = {
          StringEquals = {
            "${var.aws_iam_openid_connect_provider_arn}:aud" : "sts.amazonaws.com",
            "${var.aws_iam_openid_connect_provider_arn}:sub" : "system:serviceaccount:kube-system:${var.service_account}"
          }
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  policy_arn = aws_iam_policy.this.arn
  role       = aws_iam_role.this.name
}



