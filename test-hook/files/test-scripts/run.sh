#!/bin/sh

# echo "Installing curl..."
# apk update && apk add --no-cache curl

# echo "Executing curl request to {{ .Release.Name }}"
# curl http://{{ include "test-hook.fullname" . }}:{{ .Values.service.port }}

set -eu

ping -c 4 google.com
echo "Executing HTTP request to {{ .Release.Name }} (wget)"
# print headers and fail on non-2xx:
wget -S --spider "http://{{ include "test-hook.fullname" . }}:{{ .Values.service.port }}"
# or to fetch body quietly:
# wget -qO- "http://{{ include "test-hook.fullname" . }}:{{ .Values.service.port }}" >/dev/null
