# eks-gitops-quickstart

AWS EKS GitOps Quick Start.

## Usage

Deploy EKS Cluster:

```bash
cd ./example
terraform init
terraform apply -target="module.vpc" -auto-approve
terraform apply -target="module.eks" -auto-approve
terraform apply -auto-approve
```

Configure kubectl:

```bash
terraform output -raw configure_kubectl
```

Terraform will add GitOps Bridge Metadata to the ArgoCD secret. The annotations contain metadata for the addons Helm charts and ArgoCD ApplicationSets.

```bash
kubectl get secret -n argocd -l argocd.argoproj.io/secret-type=cluster -o json | jq '.items[0].metadata.annotations'
```

The labels offer a straightforward way to enable or disable an addon in ArgoCD for the cluster:

```bash
kubectl get secret -n argocd -l argocd.argoproj.io/secret-type=cluster -o json | jq '.items[0].metadata.labels' | grep -v false | jq .
```

Bootstrap the AddOns using ArgoCD:

```bash
kubectl apply -f bootstrap/addons.yaml
```

Monitor the ArgoCD applications:

```bash
kubectl get applications -n argocd -w
```

Deploy the workloads:

```bash
kubectl apply -f bootstrap/workloads.yaml
```

Monitor the ArgoCD Workloads:

```bash
watch kubectl get -n argocd applications workloads
```

## Resources

Module Resources

### EKS

- https://github.com/terraform-aws-modules/terraform-aws-eks/tree/v20.0.0
- https://github.com/aws-ia/terraform-aws-eks-blueprints-addons/tree/v1.15.0

### VPC

- https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/v5.5.0

### GitOps Bootstrap

- https://github.com/aws-ia/terraform-aws-eks-blueprints/tree/main/patterns/gitops/getting-started-argocd

