Spark Operator
==============

## 1. Install
1. Add Helm chart
```bash
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
helm repo update
```

2. Install Spark Operator
```bash
helm install incubator/sparkoperator \
    --name fire \
    --namespace spark-operator \
    --set sparkJobNamespace=spark
```
