aws eks --region example_region update-kubeconfig --name cluster_name

aws eks --region eu-west-2 update-kubeconfig --name eks-module

kubectl exec --stdin --tty pod/auth-service-596dc5f7f7-cszq5 -- bash

kubectl port-forward pod/auth-service-596dc5f7f7-cszq5 4000:4000

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

kubectl port-forward svc/argocd-server -n argocd 8080:443

// Create a pod
kubectl run my-app --image stacksimplify/kubenginx:1.0.0

// Create a service
kubectl expose pod my-app --type=NodePort --port=80 --target-port=30592 --name=my-service

http://18.170.28.141:30592

// Pod logs
kubectl logs -f <pod name>

// exec into pod
kubectl exec -it <pod name> -- bash