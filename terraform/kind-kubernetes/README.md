# terraform-kind-kubernetes

Deploy KinD Kubernetes Clusters with Terraform using [tehcyx/kind](https://registry.terraform.io/providers/tehcyx/kind/latest/docs)

## Example

Deploy the Cluster:

```bash
terraform init
terraform apply -auto-approve
```

View the Nodes:

```bash
KUBECONFIG=/tmp/config kubectl get nodes
```

The output:

```bash
NAME                         STATUS   ROLES           AGE    VERSION
test-cluster-control-plane   Ready    control-plane   110s   v1.27.1
test-cluster-worker          Ready    <none>          85s    v1.27.1
```

Destroy the Cluster:

```bash
terraform destroy -auto-approve
```

## Resources

### Documentation
- https://registry.terraform.io/providers/tehcyx/kind/latest/docs/resources/cluster

### Releases
- https://github.com/kubernetes-sigs/kind/releases

