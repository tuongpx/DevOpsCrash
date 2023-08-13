Day 2 Operations
================
Một số scenario thường gặp trong quá trình vận hành Kubernetes

## 1. Thêm mới một node
* Step 1: [provisioning](docs#step-1-provisioning)
* Step 2: join new node into cluster

## 2. Upgrade a node
* Mark the node as unschedulable in order to ensures no new pods will get scheduled to the node while you are preparing it for removal or maintenance.
```bash
kubectl cordon <node-name>
```

* Evict all user pods from the node. They will be scheduled onto other nodes by their controller (Deployment, ReplicaSet, etc.).
```bash
kubectl drain <node-name> --ignore-daemonsets
```

* Upgrade.....

* Afterwards, allow scheduling on the node again. Then, as pods need to be scheduled they will appear back on that node.
```bash
kubectl uncordon <node-name>
```

[ref](https://www.bluematador.com/blog/safely-removing-pods-from-a-kubernetes-node)

## 3. Graceful remove a node
* `cordon` and `drain` the node as above
* Delete the node
```bash
kubectl delete node <node-name>
```

## 4. Force remove a node
If some situations, node is out of cluster and can't rejoin, you could force remove it.
```bash
kubectl delete node <node-name> --force
```
