module "example" {
  source = "../../../modules/ec2/"
 
  aws_region         = "us-west-1"
  aws_profile        = "test"
  project_identifier = "quickstart"
  keyname            = "ssh-default"
  selected_ami_type  = "amazon"
}

output "instance_id" {
  value = module.example.id
}

output "instance_ip" {
  value = module.example.ip
}
