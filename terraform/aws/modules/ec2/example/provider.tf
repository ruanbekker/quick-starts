terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region                   = var.aws_region
  profile                  = var.aws_profile
  shared_credentials_files = ["~/.aws/credentials"]
}
