`metrics-server`
================

## 1. Manual Installation
### 1.1 Installation
* Clone the repo
```bash
git clone https://github.com/kubernetes-incubator/metrics-server.git
cd metrics-server/deploy/1.8+/
```

* Config `insecure-tls` metrics server
```diff
--- a/deploy/1.8+/metrics-server-deployment.yaml
+++ b/deploy/1.8+/metrics-server-deployment.yaml
@@ -30,6 +30,11 @@ spec:
       containers:
       - name: metrics-server
         image: k8s.gcr.io/metrics-server-amd64:v0.3.1
+        command:
+        - /metrics-server
+        - --v=10
+        - --kubelet-insecure-tls
+        - --kubelet-preferred-address-types=InternalIP
         imagePullPolicy: Always
         volumeMounts:
         - name: tmp-dir
```

* Apply manifests
```bash
kubectl apply -f .
```

### 1.2 Problems
* insecure TLS
* restart kubelet
* ready health check

## 2. Other projects
### 2.1. [~~`heapster`~~](https://github.com/kubernetes-retired/heapster)
// Deprecated

[Deploy Heapster on Kubernetes 1.11+](https://brookbach.com/2018/10/29/Heapster-on-Kubernetes-1.11.3.html)
