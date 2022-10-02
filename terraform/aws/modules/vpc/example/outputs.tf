output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets_id" {
  value = module.vpc.private_subnets_id[0]
}

output "public_subnets_id" {
  value = module.vpc.public_subnets_id[0]
}
