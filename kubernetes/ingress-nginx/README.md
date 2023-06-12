# ingress-nginx quickstart


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

## Create a Cluster

Then deploy a 1 node cluster:

```bash
kind create cluster --name workshop --config kind-config.yaml
```

Verify connectivity by viewing the nodes:

```bash
kubectl get nodes --context kind-workshop   
```

Switch to the `kind-workshop` kubernetes context:

```bash
kubectl config use-context kind-workshop
```

### Deploy Ingress Nginx

Create the namespace:

```bash
kubectl create namespace ingress-nginx
```

Deploy Ingress Nginx:

```bash
kubectl apply -n ingress-nginx -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.1/deploy/static/provider/kind/deploy.yaml
```

Ensure all pods are running:

```bash
kubectl wait -n ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
kubectl get pods -n ingress-nginx
```

## Deploy a Web App

Deploy the application:

```bash
kubectl apply -f deployment/
```

View the ingress:

```bash
kubectl get ingress -n default
```

## Access the Web App

Access the application on http://example.127.0.0.1.nip.io

## Destroy

Tear down the application:

```bash
kubectl delete -f deployment/
```

Tear down the cluster:

```bash
kind delete cluster --name workshop
```

## Resources

- [Kind: Ingress Nginx](https://kind.sigs.k8s.io/docs/user/ingress/)
