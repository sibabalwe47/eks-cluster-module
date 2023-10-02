# Resource: FluentBit Agent ConfigMap
resource "kubernetes_config_map_v1" "fluentbit_configmap" {
  metadata {
    name = "fluent-bit-cluster-info"
    namespace = kubernetes_namespace_v1.amazon_cloudwatch.metadata[0].name 
  }
  data = {
    "cluster.name" = var.cluster_name
    "http.port"   = "2020"
    "http.server" = "On"
    "logs.region" = data.aws_region.current.name
    "read.head" = "Off"
    "read.tail" = "On"
  }
}