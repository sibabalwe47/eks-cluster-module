resource "kubectl_manifest" "cloudwatch_agent_serviceaccount" {
  depends_on = [ kubernetes_namespace_v1.amazon_cloudwatch ]
  for_each = data.kubectl_file_documents.cloudwatch_agent_docs.manifests
  yaml_body = each.value
}

