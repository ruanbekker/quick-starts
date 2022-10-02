variable "environment" {
  description = "The Target Environment"
}

variable "vpc_cidr" {
  description = "The CIDR for the VPC"
}

variable "public_subnets_cidr" {
  type        = list
  description = "The CIDR for the Public Subnets"
}

variable "private_subnets_cidr" {
  type        = list
  description = "The CIDR block for the Private Subnets"
}

variable "region" {
  description = "The target AWS Region to use"
}
