# kind-3-node-cluster

3 Node Kubernetes Local Cluster with KinD

## Create

Create a cluster:

```bash
kind create cluster --name sektor --config kind.yaml
```

## View

View the nodes:

```bash
kubectl get nodes -o wide
```

## Delete

List the clusters:

```bash
kind get clusters
```

Delete the cluster:

```bash
kind delete cluster --name sektor
```
