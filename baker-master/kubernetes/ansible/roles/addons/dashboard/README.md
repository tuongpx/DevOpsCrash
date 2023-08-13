`kubernetes-dashboard`
======================

## 1. Manual install
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
```

Access dashboard at
```
kubectl -n kube-system port-forward services/kubernetes-dashboard 8443:443
open https://localhost:8443
```
--or--
```bash
kubectl proxy
open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```

[ref](https://github.com/kubernetes/dashboard#getting-started)

### 1.1. Dashboard User
1. Create `dashboard` service account
```bash
kubectl apply -f templates/dashboard-rbac.yaml # Nhớ provide các placeholder
```

2. Get Token
```bash
kubectl -n kube-system get secret $(kubectl -n kube-system get sa dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode
--or--
kubectl -n kube-system describe secret $(kubectl -n kube-system get sa dashboard -o=jsonpath='{.secrets[*].name}')
```

## 2. Ansible
| Parameter                  | Type    | Description                                                  | Default          |
|----------------------------|---------|--------------------------------------------------------------|------------------|
| `dashboard_version`        | string  | Kubernetes Dashboard version                                 | `v1.10.1`        |
| `dashboard_namespace`      | string  | Namespace of kubernetes that dashboard will be deployed      | `kube-dashboard` |
| `dashboard_admin_deployed` | boolean | Deploy `dashboard` service account with `cluster-admin` role | `true`           |

## 3. Reference
* Dzone [tutorial](https://dzone.com/articles/how-to-install-the-kubernetes-dashboard)
* [creat admin user](https://github.com/kubernetes/dashboard/wiki/Creating-sample-user)  
* provide `kubernetes-dashboard` service account `cluster-admin` permission ([see](https://github.com/kubernetes/dashboard/wiki/Access-control#admin-privileges))
* Kubernetes [Access control](https://github.com/kubernetes/dashboard/wiki/Access-control)
