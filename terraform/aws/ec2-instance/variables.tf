variable "default_tags" {
  default = {
    Environment = "test"
    Owner       = "ruan"
    Project     = "terraform-quick-start"
    CostCenter  = "engineering"
    ManagedBy   = "terraform"
  }
}

variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "the region to use in aws"
}

variable "vpc" {
  type        = string
  description = "the vpc to use"
}

variable "keyname" {
  type        = string
  description = "ssh key to use"
}

variable "subnetid" {
  type        = string
  description = "the subnet id where the ec2 instance needs to be placed in"
}

variable "instance_type" {
  type        = string
  default     = "t3.nano"
  description = "the instance type to use"
}

variable "project_id" {
  type        = string
  default     = "terraform-quick-start"
  description = "the project name"
}

variable "ebs_root_size_in_gb" {
  type        = number
  default     = 20
  description = "the size in GB for the root disk"
}

variable "environment_name" {
   type    = string
   default = "test"
   description = "the environment this resource will go to (assumption being made theres one account)"
}

variable "arch" {
  type        = string
  default     = "x86_64"
  description = "architecture"
}
