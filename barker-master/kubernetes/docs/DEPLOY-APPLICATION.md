Deploy Application
==================

## 1. Ad-hoc command
1. Deploy an application
```bash
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080
```

2. Expose application internally
```bash
kubectl expose deployment/kubernetes-bootcamp --port 8080
```

Now, you can access this app from localhost via `port-forward`
```bash
kubectl port-forward service/kubernetes-bootcamp 1234:8080
open localhost:1234
```

3. Access application publicly via `ingress`
```bash
kubectl apply -f demo-ingress.yaml
open demos.k8s.teko.vn
```

4. Scale your app
```bash
kubectl scale deployments/kubernetes-bootcamp --replicas=4
```

5. Upgrade your app
```bash
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
```
