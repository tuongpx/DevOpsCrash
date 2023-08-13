`cert-manager`
==============

## 1. Installation
```yaml
# Install the CustomResourceDefinition resources separately
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/00-crds.yaml

# Create the namespace for cert-manager
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/01-namespace.yaml

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install the cert-manager Helm chart
helm install \
  --name cert-manager \
  --namespace cert-manager \
  --version v0.7.2 \
  --values values.yaml \
  jetstack/cert-manager
```
[ref](https://docs.cert-manager.io/en/latest/getting-started/install.html#steps)

## 2. Create Issuer
```bash
kubectl apply -f letsencrypt-prod.yaml
```

Supported issuer types:
* [CA](https://docs.cert-manager.io/en/latest/tasks/issuers/setup-ca.html) - issue certificates signed by a X509 signing keypair, stored in a Secret in the Kubernetes API server.
* [Self signed](https://docs.cert-manager.io/en/latest/tasks/issuers/setup-selfsigned.html) - issue self signed certificates.
* [ACME](https://docs.cert-manager.io/en/latest/tasks/issuers/setup-acme/index.html) - issue certificates obtained by performing challenge validations against an ACME server such as [Let’s Encrypt](https://letsencrypt.org).
  * [Tutorial](https://docs.cert-manager.io/en/latest/tutorials/acme/index.html)
* [Vault](https://docs.cert-manager.io/en/latest/tasks/issuers/setup-vault.html) - issue certificates from a Vault instance configured with the [Vault PKI backend](https://www.vaultproject.io/docs/secrets/pki/index.html).
* [Venafi](https://docs.cert-manager.io/en/latest/tasks/issuers/setup-venafi.html) - issue certificates from a [Venafi](https://venafi.com) Cloud or Trust Protection Platform instance.

[ref](https://docs.cert-manager.io/en/latest/tasks/issuers/index.html#supported-issuer-types)

## 2. Usage
### 2.1 Manual create Certificate
```yaml
apiVersion: certmanager.k8s.io/v1alpha1
kind: Certificate
metadata:
  name: example-com
spec:
  secretName: example-com-tls
  duration: 2160h     # 90d
  renewBefore: 360h   # 15d
  commonName: example.com
  dnsNames:
  - example.com
  - www.example.com
  issuerRef:
    name: ca-issuer
    kind: Issuer
  # for ACME (Let's Encrypt) only
  # acme:
  #   config:
  #   - domains:
  #     - foobar.teko.vn
  #     http01: {}
```

[ref](https://docs.cert-manager.io/en/latest/tasks/issuing-certificates/index.html) | [ACME Tutorial](https://docs.cert-manager.io/en/latest/tutorials/acme/index.html) | [Upgrade to v0.8](https://docs.cert-manager.io/en/latest/tasks/upgrading/upgrading-0.7-0.8.html)

### 2.2 Automatic Certificates for Ingress resources
```yaml
apiVersion: extensions/v1beta1  # or networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: nginx
  annotations:
    kubernetes.io/tls-acme: "true"
spec:
  tls:  # this session is required
  - secretName: sample-cert
    hosts:
    - foobar.teko.vn
  rules:
  - host: foobar.teko.vn
    http:
      paths:
      - backend:
          serviceName: nginx
          servicePort: 80
```

[ref](https://docs.cert-manager.io/en/latest/tasks/issuing-certificates/ingress-shim.html)

## 3. References
- [docs](https://docs.cert-manager.io/)
