resource "kubernetes_cluster_role_binding" "this" {
  metadata {
    name = "${var.eks_cluster_name}-eks-cluster-role"
  }

  role_ref {
    api_group  = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = kubernetes_cluster_role_v1.this.metadata.0.name
  }

  subject {
    kind = "Group"
    name = "eks-readonly-group"
    api_group = "rbac.authorization.k8s.io"
  }
}