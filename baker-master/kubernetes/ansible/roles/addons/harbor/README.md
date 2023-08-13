`harbor`
========

## 1. Installation
```bash
helm repo add harbor https://helm.goharbor.io
helm repo update

helm install --name pearl harbor/harbor \
  --namespace harbor-registry \
  --values values.yaml
## or ##
helm upgrade pearl harbor/harbor \
  --namespace harbor-registry \
  --values values.yaml
```
## 2. Ansible
| Parameter                 | Type          | Description                                                 | Default           |
|---------------------------|---------------|-------------------------------------------------------------|-------------------|
| `harbor_namespace`        | string        | Namespace of kubernetes that harbor will be deployed        | `harbor-registry` |
| `harbor_release_name`     | string        | Helm release name                                           | `pearl`           |
| `harbor_core_domain`      | string        | Domain name for Harbor core service                         | //required        |
| `harbor_notary_domain`    | string        | Domain name for Harbor notary service                       | //required        |
| `harbor_gcs_bucket_name`  | string        | GCS bucket name which Harbor used to store image + chart    | //required        |
| `harbor_gcs_sa_key`       | JSON content  | Service Account key for above GCS bucket                    | //required        |
