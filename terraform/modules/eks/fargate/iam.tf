resource "aws_iam_role" "eks_fargate_role" {
  name = "${var.cluster_name}-eks-fargate-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks-fargate-pods.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "eks_AmazonEKSWorkerNodePolicy" {
  name       = "eks_AmazonEKSFargatePodExecutionRolePolicy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  roles      = [aws_iam_role.eks_fargate_role.name]
}