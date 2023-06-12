# argocd quickstart

Argo CD is an open source, declarative, GitOps Continuous Delivery tool for Kubernetes applications.

## Getting started

You will need the following:

- [docker](https://docs.docker.com/get-docker/)
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [helm](https://helm.sh/docs/intro/install/)

Install a kubernetes cluster locally, we will need to install kind:

```bash
brew install kind
```

## Deploy a Cluster

Then deploy a 1 node cluster:

```bash
kind create cluster --name quickstart --config kind-config.yaml
```

Verify connectivity by viewing the nodes:

```bash
kubectl get nodes --context kind-quickstart
```

Switch to the `kind-quickstart` kubernetes context:

```bash
kubectl config use-context kind-quickstart
```

## Deploy Argo CD

Create the namespace:

```bash
kubectl create namespace argocd
```

Deploy Argo CD:

```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Ensure all pods are running:

```bash
kubectl get pods -n argocd
```

Get the initial admin password:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Port forward to the server:

```bash
kubectl -n argocd port-forward svc/argocd-server 8080:80
```

Access the UI on http://localhost:8080

## Clean Up

Delete the cluster:

```bash
kind delete cluster --name quickstart
```

## Where to go from here

- [ArgoCD](https://argo-cd.readthedocs.io/en/stable/getting_started/)
- [Redhat Tutorial](https://redhat-scholars.github.io/argocd-tutorial/argocd-tutorial/01-setup.html)
