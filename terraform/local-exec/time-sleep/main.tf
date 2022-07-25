resource "null_resource" "previous" {
  provisioner "local-exec" {
    command = "echo 'foo' > file.txt"
  }
}

resource "time_sleep" "wait_10_seconds" {
  depends_on = [null_resource.previous]
  create_duration = "10s"
  destroy_duration = "10s"
}

resource "null_resource" "next" {
  depends_on = [time_sleep.wait_10_seconds]
}