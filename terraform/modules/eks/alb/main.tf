resource "helm_release" "loadbalancer_controller" {
  depends_on = [ aws_iam_role.this ]
  name = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart = "aws-load-balancer-controller"

  namespace = "kube-system"

  set {
    name = "image.repository"
    value = "602401143452.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/amazon/aws-load-balancer-controller"
  }

  set {
    name = "serviceAccount.create"
    value = "true"
  }

  set {
    name = "serviceAccount.name"
    value = var.service_account
  }

  set {
    name = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.this.arn}"
  }

  set {
    name = "vpcId"
    value = var.vpc_id
  }

  set {
    name = "region"
    value = data.aws_region.current.name
  }

  set {
    name = "clusterName"
    value = var.eks_cluster_name
  }
}