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
# helm install [release-name] [chart-name]
helm install local-wp bitnami/wordpress --version=24.2.6

minikube start
minikube service local-wp-exposed

kubectl version
kubectl config current-context
kubectl get pod
kubectl get svc
kubectl get secret
kubectl get deploy
kubectl describe secret local-wp-wordpress
kubectl describe pod local-wp-wordpress-7b4d8895f-rc9kf
kubectl expose deploy local-wp-wordpress --type=NodePort --name=local-wp-exposed
