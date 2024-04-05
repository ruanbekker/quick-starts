// Locals
locals {
  name            = "eks-quickstart"
  region          = var.aws_region
  profile         = var.aws_profile
  cluster_version = var.kubernetes_version
  vpc_cidr        = var.vpc_cidr
  azs             = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = local.name
    AccountId  = data.aws_caller_identity.current.account_id
  }
}

