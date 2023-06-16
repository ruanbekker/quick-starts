# grafana-prometheus quickstart

This quick-start will show you how to deploy prometheus and grafana as two different deployable releases.


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

## Helm Repositories

Add the prometheus repository:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

Add the grafana repository:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

## Deploy Prometheus

Create the namespace:

```bash
kubectl create namespace monitoring
```

Deploy the Prometheus Operator:

```bash
helm upgrade --install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --set server.persistentVolume.size=10Gi,server.retention=14d
```

View the deployed resources:

```bash
kubectl -n monitoring get pods,pv,pvc
```

One the deployment has finished, you can port forward to the prometheus service:

```bash
kubectl -n port-forward svc/prometheus 9090:9090
```

## Deploy Grafana

Deploy Grafana into the monitoring namespace:

```bash
helm upgrade --install grafana grafana/grafana \
  --namespace monitoring \
  --set persistence.enabled=true,persistence.type=pvc,persistence.size=10Gi 
```

Get the admin password for grafana:

```bash
kubectl -n monitoring get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

Port forward to the grafana service:

```bash
kubectl -n monitoring port-forward service/grafana 3000:80
```

Dashboard that are nice to have:

- [1860](https://grafana.com/grafana/dashboards/1860-node-exporter-full/)

## Destroy

Tear down the applications:

```bash
helm -n monitoring uninstall prometheus
helm -n monitoring uninstall grafana
```

Tear down the cluster:

```bash
kind delete cluster --name quickstart
```

## Resources

- [Prometheus Helm Chart](https://github.com/prometheus-community/helm-charts)
- [Grafana Helm Chart](https://github.com/grafana/helm-charts)
- [Kind: Ingress Nginx](https://kind.sigs.k8s.io/docs/user/ingress/)
