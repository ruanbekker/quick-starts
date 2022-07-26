module "example" {
  source = "../../../modules/ec2/"
 
  aws_region         = "us-west-1"
  aws_profile        = "test"
  project_identifier = "quickstart"
  keyname            = "ssh-default"
  vpc_id             = "vpc-xxxxxxxx"
  subnet_id          = "subnet-xxxxxx"
}

output "instance_id" {
  value = module.example.id
}

output "instance_ip" {
  value = module.example.ip
}
