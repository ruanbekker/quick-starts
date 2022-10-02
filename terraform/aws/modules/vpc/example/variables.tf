variable "region" {
  description = "us-east-2"
}

variable "environment" {
  description = "The Target Environment"
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC"
}

variable "key_file" {
  description = "file of public key to use"
  default     = "~/.ssh/test.pub"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR for the Public Subnets"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR for the Private Subnets"
}
