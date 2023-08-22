module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "${local.eks_name}-${local.environment}"
  region   = "eu-west-2"
  tags = {
    ConfigManagement = "Terraform"
    Owner            = local.eks_name
    Site             = "eks"
    Billing          = "Cloud Services"
    Environment      = "dev"
  }
}


module "eks" {
  source = "../../modules/eks"

  // Cluster 
  eks_name    = local.eks_name
  eks_version = "1.27"

  // Authorized roles and user
  configmap_roles = []
  configmap_users = []

  // Cluster namespaces
  namespaces = ["plusonex"]

  // Network
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.vpc_public_subnets

  // Nodes
  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.medium"]
  scaling_config = {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }



}
