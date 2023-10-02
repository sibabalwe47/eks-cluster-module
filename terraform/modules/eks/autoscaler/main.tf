resource "helm_release" "cluster_autoscaler" {
  depends_on = [ aws_iam_role.this ]
  name = var.service_account

  repository = "https://kubernetes.github.io/autoscaler"
  chart = "cluster-autoscaler"

  namespace = "kube-system"

  set {
    name = "cloudProvider"
    value = "aws"
  }

  set {
    name = "autoDiscovery.clusterName"
    value = var.eks_cluster_name
  }

  set {
    name = "awsRegion"
    value = data.aws_region.current.name
  }

  set {
    name = "rbac.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.this.arn}"
  }

  set {
    name = "rbac.serviceAccount.create"
    value = "true"
  }

  set {
    name = "rbac.serviceAccount.name"
    value = var.service_account
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