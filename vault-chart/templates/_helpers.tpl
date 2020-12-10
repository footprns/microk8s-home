{{- define "pathtoexclude" -}}
{{- join "," .Values.securityContext.capabilities.add }}
{{- end -}}