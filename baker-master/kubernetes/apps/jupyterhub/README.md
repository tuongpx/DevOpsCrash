JupyterHub
==========

## 1. Set `k8s namespace` & `helm release`
```bash
RELEASE=jove
NAMESPACE=jupiter
```

## 2. Setting up JupyterHub
### 2.1 Prepare configuration file
```bash
cat <<EOL > config.yaml
proxy:
  secretToken: "$(openssl rand -hex 32)"
EOL
```

### 2.2 Install JupyterHub
1. Add helm repo
```bash
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
```

2. Deploy JupyterHub
```bash
helm upgrade --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE  \
  --version=0.8.2 \
  --values config.yaml
```

ref: [z2jh](https://z2jh.jupyter.org/en/latest/setup-jupyterhub.html) | [chart versions](https://jupyterhub.github.io/helm-chart/) | [compat-table](https://github.com/jupyterhub/helm-chart#versions-coupled-to-each-chart-release)

## 3. Upgrade JupyterHub
```bash
helm upgrade $RELEASE jupyterhub/jupyterhub \
  --version=0.8.2 \
  --values config.yaml
```

[ref](https://z2jh.jupyter.org/en/latest/extending-jupyterhub.html)
