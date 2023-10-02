module "eks_cluster" {
  source      = "./cluster"
  name        = var.eks_name
  eks_version = "1.27"
  subnet_ids  = var.subnet_ids


}

module "configMap" {
  depends_on = [ module.eks_cluster ]
  source          = "./configmaps"
  configmap_roles = var.configmap_roles
  configmap_users = var.configmap_users
}

module "oidc_provider" {
  source                        = "./oidc"
  eks_cluster_identity_oidc_url = module.eks_cluster.eks_cluster_identity[0].oidc[0].issuer
}

module "fargate_profile" {
  source = "./fargate"
  depends_on = [ module.eks_cluster]
  profile_names = ["fargate-wl"]
  cluster_name = var.eks_name
  subnet_ids  = var.fargate_subnets
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

module "namespaces" {
  depends_on = [ module.eks_cluster, module.oidc_provider ]
  source     = "./namespaces"
  namespaces = var.namespaces
}

module "rbac" {
  depends_on = [ module.eks_cluster, module.oidc_provider ]
  source = "./rbac"
  eks_cluster_name = var.eks_name
}

module "alb" {
  depends_on = [ module.eks_cluster, module.oidc_provider ]
  source            = "./alb"
  service_account   = "aws-load-balancer-controller"
  aws_iam_openid_connect_provider_arn = module.oidc_provider.aws_iam_openid_connect_provider_extracted_arn
  vpc_id            = var.vpc_id
  eks_cluster_name          = var.eks_name
}

module "autoscaler" {
  depends_on = [ module.eks_cluster, module.oidc_provider ]
  source = "./autoscaler"
  service_account = "cluster-autoscaler"
  aws_iam_openid_connect_provider_arn = module.oidc_provider.aws_iam_openid_connect_provider_extracted_arn
  eks_cluster_name          = var.eks_name
}


module "argocd" {
  depends_on = [ module.eks_cluster, module.oidc_provider ]
  source  = "lablabs/argocd/helm"
  version = "1.0.0"
  enabled           = true
  argo_enabled      = false
  argo_helm_enabled = false
  self_managed = false
  helm_release_name = "argocd"
  namespace         = "argocd"
  helm_timeout = 240
  helm_wait    = true
}

module "metrics_server" {
  source = "./metrics-server"
  cluster_name = var.eks_name
}

module "vpa" {
  source = "./vertical-autoscaler"
}

# module "cloudwatch" {
#   source = "./cloudwatch"
#   cluster_name = var.eks_name
# }