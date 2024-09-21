`helm`
======

## 1. Install helm
1. install helm (client-site component)
```bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | sudo bash
```

[ref](https://helm.sh/docs/using_helm/#from-script)

2. install tiller (server-site component)
```bash
kubectl create -f helm-rbac.yaml
helm init --service-account tiller --history-max 200
```

[ref](https://helm.sh/docs/using_helm/#easy-in-cluster-installation)
