# goto https://artifacthub.io/ search chart, e.g. wordpress
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
#based on information in index.yaml, it can update accordingly https://repo.broadcom.com/bitnami-files/index.yaml
helm repo update
helm search repo wordpress

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm search repo prometheus --max-col-width 20
helm show chart bitnami/wordpress
