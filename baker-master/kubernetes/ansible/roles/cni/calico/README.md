`CNI/calico`
============

## 1. Manual Install
1. Download kubernetes manifest
```bash
curl -O https://docs.projectcalico.org/v3.6/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/typha/calico.yaml
```

2. Modify pod cidr
```bash
POD_CIDR="<your-pod-cidr>"
sed -i -e "s?192.168.0.0/16?$POD_CIDR?g" calico.yaml
```

3. Apply the manifest
```bash
kubectl apply -f calico.yaml
```

[ref](https://docs.projectcalico.org/v3.6/getting-started/kubernetes/installation/calico#installing-with-the-kubernetes-api-datastoremore-than-50-nodes)

## 2. Customize
Bạn có thể customize calico mà không cần modify `calico.yaml` nhờ vào [kustomize](https://kustomize.io/).
1. Download `calico.yaml` vào folder `templates/`
2. Modify các file template trong folder `templates/`
3. Apply
```bash
kubectl apply -k templates/                         # kubectl 1.14+
## or ##
kustomize build templates/ | kubectl apply -f -     # kubectl <=1.14
```

## 3. Ansible
Bạn có thể dùng Ansible để cài `calico` với ansible role là `cni/calico`
### 3.1 Ansible role Configuration
| Parameter            | Type    | Description                                | Default                                   |
|----------------------|---------|--------------------------------------------|-------------------------------------------|
| `calico_version`     | string  | Version of calico will be installed        | `v3.6`                                    |
| `calico_namespace`   | string  | k8s namespace that calico will be deployed | `kube-networking`                         |
| `calico_pod_cidr`    | string  | Kubernetes Pod CIDR                        | `kubernetes_pod_cidr` or `192.168.0.0/16` |
| `calicoctl_deployed` | boolean | Deploy calicoctl client                    | `false`                                   |

[ref](defaults/main.yaml)
