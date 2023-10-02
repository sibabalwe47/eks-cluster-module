resource "aws_iam_group" "this" {
  name = "${var.eks_cluster_name}-eks-readonly-group"
  path = "/"
}

resource "aws_iam_group_policy" "this" {
  name = "${var.eks_cluster_name}-eks-readonly-group-policy"
  group = aws_iam_group.this.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole"
        ]
        Effect   = "Allow"
        Sid = "AllowAssumeOrganizationAccountRole"
        Resource = "${aws_iam_role.this.arn}"
      },
    ]
  })
}