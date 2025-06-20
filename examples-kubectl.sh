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

kubectl version
kubectl api-versions
kubectl config current-context
