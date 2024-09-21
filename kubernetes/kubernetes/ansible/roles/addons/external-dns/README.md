`external-dns`
==============

## I. Credential
### 1. Google Cloud DNS
* **Option 1**. For new k8s cluster on GCP, `external-dns` needs the `https://www.googleapis.com/auth/ndev.clouddns.readwrite` scope in order to manage your DNS records. When creating a new GKE cluster or node pool you can pass this value as an argument to `--scopes`.
```bash
gcloud container clusters create "gke-xdns" \
    --num-nodes 1 \
    --scopes "https://www.googleapis.com/auth/ndev.clouddns.readwrite"
# or #
gcloud container node-pools create "pool-xdns" \
    --cluster "gke-exists-cluster" \
    --scopes "https://www.googleapis.com/auth/ndev.clouddns.readwrite"
```

* **Option 2**. You can also force `external-dns` to use a specific service account by providing it a service account credentials file via a mounted secret.
```bash
PROJECT_ID=$(gcloud config get-value project)
SERVICE_ACCOUNT_NAME=k8s-xdns-sa
SERVICE_ACCOUNT_DEST=~/.gcp/k8s-xdns-sa.json

gcloud iam service-accounts create \
    $SERVICE_ACCOUNT_NAME \
    --display-name "Kubernetes ExternalDNS"

SA_EMAIL=$(gcloud iam service-accounts list \
        --filter="name:$SERVICE_ACCOUNT_NAME" \
        --format='value(email)')

# ref: https://cloud.google.com/iam/docs/understanding-roles
# cmd: gcloud iam roles list
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$SA_EMAIL \
    --role roles/dns.admin

mkdir -p $(dirname $SERVICE_ACCOUNT_DEST)
gcloud iam service-accounts keys create $SERVICE_ACCOUNT_DEST \
    --iam-account $SA_EMAIL
```

Store that service account key into Kubernetes secret:
```bash
kubectl create secret generic gcloud-config --from-file="credentials.json=$SERVICE_ACCOUNT_DEST"
```

## 2. Installation
```yaml
helm install --name google-dns \
    --namespace external-dns \
    --values values.yaml \
    stable/external-dns
### or ###
helm upgrade google-dns \
    --values values.yaml \
    stable/external-dns
```

## 3. Usage
### 3.1 In `Services`
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx
  annotations:
    external-dns.alpha.kubernetes.io/hostname: nginx.sample.teko.vn
    external-dns.alpha.kubernetes.io/ttl: "120" #optional
spec:
  selector:
    app: nginx
  type: LoadBalancer    # TODO Support for Services with `type=NodePort`
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
```

> With service `type=LoadBalancer`, underlay *Cloud Provider* will create a **TCP** Load balancer.  
> After that, `external-dns` will talk to *DNS provider* to point DNS record to that *LB's frontend IP*.  
> No configuration for **TLS**.

### 3.2 In `Ingress`
```yaml
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: nginx
spec:
  rules:
  - host: via-ingress.external-dns.gcp.teko.vn
    http:
      paths:
      - backend:
          serviceName: nginx
          servicePort: 80
```

There are 2 kinds of ingress controllers:
> [`Nginx`](https://github.com/kubernetes/ingress-nginx), [`Traefik`](https://traefik.io/) with `service.type=LoadBalancer`.  
> It will create a route with *IP Address* is service **External IP of Ingress Controller**.  
> Then `external-dns` will talk to *DNS provider* in order to create DNS record base on that *IP address*.  
> **TLS** is managed internally by Ingress Controller.

> [`GCE`](https://github.com/kubernetes/ingress-gce)  
> `GCE` ingress controller with talk to underlay *Cloud Provider* to create **HTTP(S)** Load balancer.  
> Then `external-dns` will talk to *DNS provider* to point DNS record to its *LB's frontend IP*.  
> **TLS** certificate will be sync to externnal LB.

### 3.3 In `Istio Gateway`
[ref](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/tutorials/istio.md)
