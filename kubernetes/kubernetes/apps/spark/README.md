Spark on Kubernetes
===================

## 1. Config JupyterHub
### 1.1. Create spark service-account
```bash
kubectl apply -f spark-sa.yaml -n jupiter
```

### 1.2. Config KuberSpawner
```diff
--- a/apps/jupyterhub/config.yaml
+++ b/apps/jupyterhub/config.yaml
singleuser:
   profileList:
   - display_name: "PySpark"
     kubespawner_override:
       image: jupyter/pyspark-notebook:65761486d5d3
+      service_account: spark-sa
```

## 2. Spark on Kubernetes
### 2.1 deploy-mode: `cluster`
```bash
${SPARK_HOME}/bin/spark-submit \
    --master k8s://https://kubernetes.default \
    --deploy-mode cluster \
    --name spark-pi \
    --class org.apache.spark.examples.SparkPi \
    --conf spark.executor.instances=1 \
    --conf spark.kubernetes.namespace=jupiter \
    --conf spark.kubernetes.container.image=gcr.io/spark-operator/spark:v2.4.0 \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-sa \
    local:///opt/spark/examples/jars/spark-examples_2.11-2.4.0.jar
```

### 2.2 deploy-mode: `client`
Upload & run file `example/pyspark.ipynb` on your JupyterLab

## 3. Debug & Cleanup
### 3.1 Get log of container
```bash
kubectl -n jupiter logs $(kubectl -n jupiter get pods -l spark-role=executor -o jsonpath="{.items[*].metadata.name}") -f
```

### 3.2 Cleanup Spark pods
```bash
kubectl -n jupiter delete pods -l spark-role=executor
kubectl -n jupiter delete pods -l spark-role=driver
```

## 4. TODO
* [ ] Pre-configured PySpark Jupyter using Kubernetes configmap
