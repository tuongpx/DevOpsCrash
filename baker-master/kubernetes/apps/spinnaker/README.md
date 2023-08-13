`spinnaker`
==========

## 1. Install
1. Create a Kubernetes Service Account
```bash
kubectl apply -f https://spinnaker.io/downloads/kubernetes/service-account.yml
./k8s-service-account-kubeconfig.sh spinnaker spinnaker-service-account
kubectl create secret generic --from-file kubeconfig kubeconfig -n spinnaker
```

2. Install Spinnaker
```bash
kubectl create ns spinnaker-pipelines
helm upgrade --install spin stable/spinnaker \
    --namespace spinnaker-pipelines \
    -f values.yaml
```
