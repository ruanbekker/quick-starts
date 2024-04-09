variable "aws_region" {
  type        = string
  default     = "eu-west-1"
  description = "the region to use in aws"
}

variable "aws_profile" {
  type        = string
  description = "the aws profile to use to authenticate"
}

variable "keyname" {
  type        = string
  description = "ssh key to use"
}

variable "instance_type" {
  type        = string
  default     = "t3.nano"
  description = "the instance type to use"
}

variable "project_identifier" {
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

variable "owner_name" {
   type    = string
   default = "james.dean"
   description = "the owner of this resource - mostly used for tagging"
}

variable "team_name" {
   type    = string
   default = "engineering"
   description = "the team that will be responsible for this resource - mostly for naming conventions and tagging"
}

variable "arch" {
  type        = string
  default     = "x86_64"
  description = "architecture"
}

variable "ami_configs" {
  type = map(object({
    owners : list(string)
    name_pattern : string
    architecture : string
  }))

  default = {
    ubuntu = {
      owners       = ["099720109477"]
      name_pattern = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-*-server-*"
      architecture = "x86_64"
    },
    amazon = {
      owners       = ["amazon"]
      name_pattern = "amzn2-ami-hvm-*"
      architecture = "x86_64"
    }
  }
}

variable "selected_ami_type" {
  description = "The selected AMI type (e.g., 'ubuntu', 'amazon')"
  type        = string
}
