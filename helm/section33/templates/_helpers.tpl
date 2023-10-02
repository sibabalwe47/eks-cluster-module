{{/* Parent fullname helpers */}}
{{- define "parentchart.fullname" }}
{{ default .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}