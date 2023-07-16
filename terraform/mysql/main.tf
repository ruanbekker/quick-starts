resource "mysql_database" "user_db" {
  name = var.database_name
}

resource "mysql_user" "user_id" {
  user = var.database_username
  host = "%"
}

resource "mysql_grant" "user_id" {
  user = "${mysql_user.user_id.user}"
  host = "%"
  database = var.database_name
  privileges = ["SELECT", "UPDATE"]
}

resource "mysql_user_password" "user_id" {
  user    = "${mysql_user.user_id.user}"
  host = "%"
  pgp_key = "keybase:${var.keybase_username}"
}
