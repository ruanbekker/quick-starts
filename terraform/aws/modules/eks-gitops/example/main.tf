module "eks_gitops" {
  source = "../"
 
  aws_profile        = "personal"
  aws_region         = "us-west-2"
  environment        = "dev"
  vpc_cidr           = "10.0.0.0/16"
  kubernetes_version = "1.28"

  addons = {
    enable_aws_load_balancer_controller = true
    enable_metrics_server               = true
  }
}

output "configure_kubectl" {
  value = module.eks_gitops.configure_kubectl
}

output "configure_argocd" {
  value = module.eks_gitops.configure_argocd
}

output "access_argocd" {
  value = module.eks_gitops.access_argocd
}


