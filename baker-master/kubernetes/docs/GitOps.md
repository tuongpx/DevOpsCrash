GitOps
======
GitOps is a way to do Continuous Delivery.  It works by using Git as a single source of truth for declarative infrastructure and applications. With Git at the center of your delivery pipelines, developers can make pull requests to accelerate and simplify application deployments and operations tasks to Kubernetes.
![](https://pbs.twimg.com/media/DeCjgiGXcAAqsNW.jpg:large)

## 1. Principles of GitOps
1. The entire system described declaratively.
Kubernetes is just one example of many modern cloud native tools that are “declarative” and that can be treated as code.
2. The canonical desired system state versioned in Git.
With the declaration of your system stored in a version control system, and serving as your canonical source of truth, you have a single place from which everything is derived and driven.
3. Approved changes can be automatically applied to the system.
Once you have the declared state kept in Git, the next step is to allow any changes to that state to be automatically applied to your system.
4. Software agents to ensure correctness and alert on divergence.
Once the state of your system is declared and kept under version control, software agents can inform you whenever reality doesn’t match your expectations.

## 2. CIOps vs GitOps
Typical push pipeline with read/write permission outside of the cluster:
![CIOps](https://lh4.googleusercontent.com/186Yfhls2c1h3cDOMpk0f8mvsBhEnQjf1V68rCAK8RtzsPf9tyk96_Y_02rJ4GKYhzcEzSfF8-F7NoDtPUxJDJcgLnVq-H2Y9a0lYrt-WBbpsrShR2Ap82Z8gqowdu4V6CM6jhoH)
In GitOps, images are pulled and credentials are kept inside the cluster:
![GitOps](https://lh3.googleusercontent.com/Wk1JGlUSTZQi4rRj7WnXfOwMdtI7zaM-y3SdUBB-jQV1-UmmwNk5X5qvAGZKoQp_KoAGtvlM-su9llIHNiUBD8QV0z4UyBD3o0IKqjUblMGuQqiX4cUY2XG1e_0drBy_MCxC62T8)
### 2.1 CIOps is anti-pattern
CI must have access to the Kubernetes API. Firstly, this poses a security risk, as we wrote previously. Additionally, this also means that they have to ensure that each CI job is configured correctly to deploy to the right cluster and that it has up-to-date credentials. Whenever they refresh those credentials or bring up a new cluster, re-configuring multiple CI jobs can be challenging, especially with many apps deployed independently. They may attempt to limit access to e.g. a single namespace dedicated for the given app, but such credentials are even harder to manage, as there is no tool that can  manage Kubernetes credentials with limited scopes and can configure the given CI product as well.

## 3. GitOps with WeaveWorks Flux
![GitOps](https://raw.githubusercontent.com/stefanprodan/openfaas-flux/master/docs/screens/flux-helm-gitops.png)

## 4. References
- [GitOps](https://www.weave.works/technologies/gitops/)
- [What Is GitOps Really?](https://www.weave.works/blog/what-is-gitops-really)
- [GitOps - Operations by Pull Request](https://www.weave.works/blog/gitops-operations-by-pull-request)