`ingress/traefik`
================

## 1. Manual installation
0. Pre-requirement
* Helm

1. Install
1.1 Traefik ingress
```bash
helm install stable/traefik \
    --name=janus \
    --namespace=traefik-ingress \
    --values=values.yaml
--or--
helm upgrade janus stable/traefik \
    --values=values.yaml
```

ref: [docs](https://docs.traefik.io/user-guide/kubernetes/) | [helm chart](https://hub.kubeapps.com/charts/stable/traefik)

## 2. Ansible
| Parameter                  | Type    | Description                                                  | Default           |
|----------------------------|---------|--------------------------------------------------------------|-------------------|
| `traefik_namespace`        | string  | Namespace of kubernetes that traefik will be deployed        | `traefik-ingress` |
| `traefik_release_name`     | string  | Helm release name                                            | `janus`           |
