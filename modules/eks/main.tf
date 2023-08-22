module "eks_cluster" {
  source      = "./cluster"
  name        = var.eks_name
  eks_version = "1.27"
  subnet_ids  = var.subnet_ids
}

module "configMap" {
  source          = "./configmaps"
  configmap_roles = var.configmap_roles
  configmap_users = var.configmap_users
}

module "oidc_provider" {
  source                        = "./oidc"
  eks_cluster_identity_oidc_url = module.eks_cluster.eks_cluster_identity[0].oidc[0].issuer
}

module "nodegroup" {
  depends_on       = [module.oidc_provider]
  source           = "./nodegroup"
  eks_cluster_name = var.eks_name
  eks_version      = "1.27"
  public_subnets   = var.subnet_ids
  ami_type         = var.ami_type      # "AL2_x86_64"
  capacity_type    = var.capacity_type # "ON_DEMAND"
  instance_types   = var.instance_types
  scaling_config   = var.scaling_config
}

# module "namespaces" {
#   source     = "./namespaces"
#   namespaces = var.namespaces
# }

# module "alb" {
#   source            = "./alb"
#   service_account   = "aws-load-balancer-controller"
#   oidc_provider_arn = module.oidc_provider.aws_iam_openid_connect_provider_arn
#   vpc_id            = var.vpc_id
#   eks_name          = "plusonex"
# }
