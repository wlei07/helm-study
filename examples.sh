# goto https://artifacthub.io/ search chart, e.g. wordpress
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo list
#based on information in index.yaml, it can update accordingly https://repo.broadcom.com/bitnami-files/index.yaml
helm repo update
helm repo remove bitnami
helm repo --help

helm search repo wordpress
helm search repo wordpress --versions
helm search repo prometheus --max-col-width 20

helm show chart bitnami/wordpress
helm show readme bitnami/wordpress
helm show values bitnami/wordpress

helm install --help
# release-name can be anything that makes sense
helm install [release-name] [chart-name]

minikube start

kubectl version
kubectl config current-context

