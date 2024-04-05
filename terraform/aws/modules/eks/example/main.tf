module "eks_cluster" {
  source = "../"
 
  aws_profile        = "personal"
  aws_region         = "us-west-2"
  environment        = "dev"
  vpc_cidr           = "10.0.0.0/16"
  kubernetes_version = "1.28"
}

output "configure_kubectl" {
  value = module.eks_cluster.configure_kubectl
}

