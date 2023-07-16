terraform {
  required_providers {
    mysql = {
      source = "Paynetworx/mysql"
      version = "1.12.7"
    }
  }
}

provider "mysql" {
  endpoint = "${var.database_host}:${var.database_port}"
  username = var.database_username
  password = var.database_password
}
