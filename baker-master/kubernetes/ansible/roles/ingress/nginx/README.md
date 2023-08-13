`ingress/nginx`
================

## 1. Manual installation
0. Pre-requirement
* Helm

1. Install
1.1 Nginx ingress
```bash
helm install stable/nginx-ingress \
    --name=tinker \
    --namespace=nginx-ingress \
    --values=values.yaml
--or--
helm upgrade tinker stable/nginx-ingress \
    --values=values.yaml
```

ref: [docs](https://kubernetes.github.io/ingress-nginx/) | [helm chart](https://hub.helm.sh/charts/stable/nginx-ingress)

## 2. Ansible
| Parameter                  | Type    | Description                                                  | Default           |
|----------------------------|---------|--------------------------------------------------------------|-------------------|
| `nginx_namespace`        | string  | Namespace of kubernetes that nginx will be deployed        | `nginx-ingress` |
| `nginx_release_name`     | string  | Helm release name                                            | `tiker`              |
