{{/* Common Labels */}}
{{- define "helmbasics.labels" }}
    app: nginx
    chartname: {{ .Chart.Name }}
    template-in-template: {{ include "helmbasics.resourceName" . }}
{{- end }}

{{/* K8s resource name: string concat with hyphen */}}
{{- define "helmbasics.resourceName" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- end -}}