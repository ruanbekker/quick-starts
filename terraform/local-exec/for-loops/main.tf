resource "null_resource" "this" {
  for_each = {
    hostname = "main.example.com"
    username = "james"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "${each.key}: '${each.value}'" >> results.yml
    EOT
  }

}