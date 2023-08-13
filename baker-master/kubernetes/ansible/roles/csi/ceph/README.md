`CSI/ceph`
==========
Role status:
- [x] ceph-csi for RBD
- [x] rbd storage volume
- [ ] ceph-csi for cephfs
- [ ] cephfs storage volume

## I. RBD (Ceph's RADOS Block Devices)
### 1. Instal `ceph-csi for rbd`
1.1. Manual way

```bash
git clone https://github.com/ceph/ceph-csi.git
cd ceph-csi
kubectl apply -f deploy/rbd/kubernetes/
```

1.2. Customize installation

Bạn có thể custom install `ceph-csi` sử dụng [kustomize](http://kustomize.io). Ví dụ:

* Copy file trong folder `./templates/rbd-driver` vào `ceph-csi/deploy/rbd/kubernetes/` ở repo vừa clone
* Modify các file template cho phù hợp
* Apply
```bash
kubectl apply -k deploy/rbd/kubernetes/                         # kubectl 1.14+
## or ##
kustomize build deploy/rbd/kubernetes/ | kubectl apply -f -     # kubectl <=1.14
```

1.3 Ansible way

Bạn có thể dùng Ansible để cài `ceph-csi` với ansible role là `csi/ceph`

| Parameter                      | Type    | Description                                                           | Default        |
|--------------------------------|---------|-----------------------------------------------------------------------|----------------|
| `ceph_namespace`               | string  | Kubernetes namespace `ceph-csi` will deploy                           | `kube-storage` |
| `ceph_csi_version`             | string  | `ceph-csi` version                                                    | `v1.0`         |
| `ceph_rbd_deploy_storageclass` | boolean | deploy `rbd` storage class. The following paramether must be provided | `true`         |

### 2. Install `rbd` storage class
Để tạo được storage class, bạn cần cung cấp nhưng biến sau:

| Parameter                | Type         | Description                           | Default |
|--------------------------|--------------|---------------------------------------|---------|
| `ceph_monitors`*         | List[string] | Comma separated list of Ceph monitors |         |
| `ceph_encoded_password`* | string       | ceph admin password                   |         |
| `ceph_user`              | string       | ceph username                         | `admin` |
| `ceph_rbd_pool`          | string       | name of rbd pool                      | `rbd`   |

Dùng command sau để get ceph admin key:
```bash
ceph auth get-key client.admin | base64
```

Sau đó bạn có thể manual deploy hoặc dùng ansible.

## II. CephFS (Ceph Filesystem)
// TODO
