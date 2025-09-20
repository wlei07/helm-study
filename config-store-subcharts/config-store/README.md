create secret:
kubectl create secret generic postgres-creds --from-env-file=.env

deploy:
helm install config-store .

wait until it's up and running:
kubectl get pods --watch

expose it for access:
minikube service config-store-override-from-parent
