resource "kubernetes_cluster_role_v1" "this" {
  metadata {
    name = "${var.eks_cluster_name}-eks-cluster-role"
  }

  rule {
    api_groups = [""]
    resources  = ["nodes", "namespaces", "pods", "events", "services"]
    verbs = ["get", "list"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "daemonsets", "statefuleset", "replicasets"]
    verbs = ["get", "list"]
  }
    rule {
    api_groups = ["batch"]
    resources  = ["jobs"]
    verbs = ["get", "list"]
  }
}