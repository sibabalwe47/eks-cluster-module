locals {
  eks_name    = "k8s"
  environment = "dev"
  service_account_name = "auth-service"

  mapRoles = yamlencode([
    {
      rolearn  = "${module.eks.aws_iam_role_arn}"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers", "system:nodes", "system:masters"]
    },
    {
      rolearn = module.eks.eks_readonly_role_arn
      username = "eks-readonly"
      groups = ["${module.eks.eks_cluster_role_subject_name}"]
    }
  ])

  mapUsers = yamlencode([
    {
      userarn  = "arn:aws:iam::386613981817:user/Sibabalwe"
      username = "Sibabalwe"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::386613981817:user/eks.plusonex"
      username = "eks.plusonex"
      groups   = ["system:masters"]
    },
    {
      userarn = "arn:aws:iam::386613981817:user/eks.user"
      username = "eks.user"
      groups = ["system:masters"]
    }
  ])
}
