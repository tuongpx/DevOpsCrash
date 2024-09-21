`logging/efk-stack`
===================

## 1. Manual Installation
1. Create `kube-logging` namespace
```bash
kubectl create ns kube-logging
```

2. Add the Elasticsearch Helm repository

```
helm repo add elastic https://helm.elastic.co
```

3. Install `elasticsearch`
```bash
helm install elastic/elasticsearch \
    --name tivan-elasticsearch \
    --namespace=kube-logging \
    --values=values/elasticsearch.yaml
```

// TODO
* [`curator`](https://github.com/elastic/curator)

4. Install `kibana`
```bash
helm install elastic/kibana \
    --name tivan-kibana \
    --namespace kube-logging \
    --values=values/kibana.yaml
```

// TODO
* Multitenancy

5. Install `fluentbit`
```bash
helm install stable/fluent-bit \
    --name fluentbit \
    --namespace kube-logging \
    --values=values/fluentbit.yaml
```

// TODO
* Support `containerd`/`cri-o` log format


## 2. Ansible
| Parameter                  | Type    | Description                                                  | Default          |
|----------------------------|---------|--------------------------------------------------------------|------------------|
| `logging_namespace`        | string  | Namespace of kubernetes that EFK will be deployed  | `kube-logging`        |
| `logging_release_name`      | string  | Release name for the EFK      | `tivan` |
| `logging_elasticsearch_release_name` | string | Release name for `elasticsearch` components | `{{logging_release_name}}-elasticsearch`           |
| `logging_fluentbit_release_name` | string | Release name for `fluent-bit` components | `{{logging_release_name}}-fluentbit`           |
| `logging_kibana_release_name` | string | Release name for `kibana` components | `{{logging_release_name}}-kibana`           |
| `logging_kibana_domain` | string | Domain name for `kibana` components | // required           |
