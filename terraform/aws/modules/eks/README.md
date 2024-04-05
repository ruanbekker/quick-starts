# eks-quickstart

AWS EKS Quick Start.

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

## Resources

Module Resources

### EKS

- https://github.com/terraform-aws-modules/terraform-aws-eks/tree/v20.0.0
- https://github.com/aws-ia/terraform-aws-eks-blueprints-addons/tree/v1.15.0

### VPC

- https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/v5.5.0

### GitOps Bootstrap

- https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/patterns/gitops/getting-started-argocd/main.tf
