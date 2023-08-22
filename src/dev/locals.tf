locals {
  eks_name    = "eks-module"
  environment = "dev"

  mapRoles = yamlencode([
    {
      rolearn  = "${module.eks.aws_iam_role_arn}"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers", "system:nodes", "system:masters"]

    }
  ])

  mapUsers = yamlencode([
    {
      userarn  = "arn:aws:iam::386613981817:user/Sibabalwe"
      username = "Sibabalwe"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::386613981817:user/root"
      username = "Sibabalwe"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::386613981817:user/eks.plusonex"
      username = "eks.plusonex"
      groups   = ["system:masters"]
    }
  ])
}
