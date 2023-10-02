resource "kubectl_manifest" "cwagent_daemonset" {
    depends_on = [
      kubernetes_namespace_v1.amazon_cloudwatch,
      kubernetes_config_map_v1.cwagentconfig_configmap,
      kubectl_manifest.cloudwatch_agent_serviceaccount
      ]
    yaml_body = data.http.get_cwagent_daemonset.response_body
}