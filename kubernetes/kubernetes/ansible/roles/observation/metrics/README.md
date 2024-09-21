`monitoring/prometheus`
=======================

## 1. Manual installation
0. Pre-requirement
* Helm

1. Install
```bash
helm install stable/prometheus-operator --name=argus --namespace=kube-monitoring
```

This include following components:
* [prometheus-operator](https://github.com/coreos/prometheus-operator)
* [prometheus](https://prometheus.io)
* [alertmanager](https://prometheus.io)
* [node-exporter](https://github.com/helm/charts/tree/master/stable/prometheus-node-exporter)
* [kube-state-metrics](https://github.com/helm/charts/tree/master/stable/kube-state-metrics)
* [grafana](https://github.com/helm/charts/tree/master/stable/grafana)

[ref](https://hub.helm.sh/charts/stable/prometheus-operator)

Default user: `admin/prom-operator`

## 2. Other projects
### 2.1. [`grafana/kubernetes-app`](https://github.com/grafana/kubernetes-app)
// TBD

### 2.2. [`node-problem-detector`](https://github.com/kubernetes/node-problem-detector)
// TBD
