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
# retrieve the values.yaml files that is available inside of the chart folder
helm show values bitnami/wordpress
# for custom values, local-wp is the name we use for the `helm install` command
helm get values local-wp
helm get values local-wp --revision 1
helm get values local-wp --all
# get the notes we see when running `helm install`
helm get notes local-wp
helm get metadata local-wp
helm history local-wp

helm install --help
# release-name can be anything that makes sense
# helm install [release-name] [chart-name]
helm install local-wp bitnami/wordpress --version=24.2.6 --set "mariadb.auth.rootPassword=myawesomepassword" --set "mariadb.auth.password=myawesomepassword"
# --values or -f, both are the same
helm install local-wp bitnami/wordpress --version=24.2.6 --values setting-values/custom-values.yaml

helm list
helm uninstall local-wp
# --reuse-values means reuse exising values if not override in the custom-values.yaml.
# note if you remove values from custom-values.yaml, it is still used.
# --cleanup-on-fail does not clean rs (replica set)
helm upgrade --reuse-values --values ~/dev/helm-study/setting-values/custom-values.yaml local-wp bitnami/wordpress --version 24.2.6 --atomic --cleanup-on-fail --debug --timeout 2m
helm rollback local-wp 3

kubectl version
kubectl config current-context
kubectl get pod
kubectl get pod --watch
kubectl get svc
kubectl get secrets
kubectl get secret local-wp-wordpress -o jsonpath='{.data.wordpress-password}' | base64 -d
kubectl get secret local-wp-mariadb -o jsonpath='{.data.mariadb-password}' | base64 -d
kubectl get secret local-wp-mariadb -o jsonpath='{.data.mariadb-root-password}' | base64 -d
kubectl get deploy
# replica set
kubectl get rs
kubectl describe secret local-wp-wordpress
kubectl describe pod local-wp-wordpress-7b4d8895f-9rs2h

kubectl expose deploy local-wp-wordpress --type=NodePort --name=local-wp-exposed
#check for persistent volume or persistent volume claim
kubectl get pv,pvc
kubectl get secret,pod,deploy,svc
kubectl get pvc
kubectl describe pvc data-local-wp-mariadb-0
kubectl describe storageclass standard # ReclaimPolicy: Delete -> so pv will be deleted when pvc is deleted
kubectl delete pvc data-local-wp-mariadb-0
kubectl delete rs local-wp-wordpress-97779fff
kubectl delete svc local-wp-exposed

kubectl logs local-wp-wordpress-7b4d8895f-fbc57

kubectl create secret generic custom-wp-credentials --from-literal wordpress-password=leipassword

minikube start
minikube service local-wp-exposed
