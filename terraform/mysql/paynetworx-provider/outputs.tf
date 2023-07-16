output "db_name" {
  value = mysql_database.user_db.name
}

output "password" {
  value = mysql_user_password.user_id.encrypted_password
}
