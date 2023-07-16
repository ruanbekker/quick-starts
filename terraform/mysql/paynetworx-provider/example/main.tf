module "test_db" {
  source = "../"

  database_host = var.database_host
  database_port = var.database_port
  database_username = var.database_username
  database_password = var.database_password
  database_name = "foobar"
  keybase_username = var.keybase_username
}

