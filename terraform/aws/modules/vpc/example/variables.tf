variable "region" {
  description = "us-east-2"
}

variable "environment" {
  description = "The Target Environment"
}

variable "vpc_cidr" {
  description = "The CIDR of the VPC"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR for the Public Subnets"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR for the Private Subnets"
}
