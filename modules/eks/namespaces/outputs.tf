output "kubernetes_namespace_v1_id" {
  value = kubernetes_namespace_v1.this[*].id
}

output "kubernetes_namespace_v1_metadata" {
  value = kubernetes_namespace_v1.this[*].metadata
}

output "wait_for_default_service_account" {
  value = kubernetes_namespace_v1.this[*].wait_for_default_service_account
}