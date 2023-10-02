data "http" "cloudwatch_agent_serviceaccount_policies" {
  url = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/main/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-serviceaccount.yaml"

  request_headers = {
    Accept = "text/*"
  }
}

data "kubectl_file_documents" "cloudwatch_agent_docs" {
  content = data.http.cloudwatch_agent_serviceaccount_policies.response_body
}


data "http" "get_cwagent_daemonset" {
  url = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cwagent/cwagent-daemonset.yaml"
  # Optional request headers
  request_headers = {
    Accept = "text/*"
  }
}

data "aws_region" "current" {}


# Datasource
data "http" "get_fluentbit_resources" {
  url = "https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/fluent-bit/fluent-bit.yaml"
  # Optional request headers
  request_headers = {
    Accept = "text/*"
  }
}

data "kubectl_file_documents" "fluentbit_docs" {
    content = data.http.get_fluentbit_resources.response_body
}