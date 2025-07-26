{{- /* Note: files start with _ will NOT be rendered when running the helm templet command. */}}
{{ define "templating-deep-dive.fullname" -}}
{{- /* := is initialize, while = is a normal assignment. */}}
{{- $defaultName := printf "%s-%s" .Release.Name .Chart.Name }}
{{- .Values.customName | default $defaultName | trunc 63 | trimSuffix "-" -}}
{{ end -}}

{{ define "templating-deep-dive.selectorLabels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
managed-by: helm
{{- end -}}
