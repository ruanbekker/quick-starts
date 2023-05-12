resource "kafka_topic" "this" {
  name               = var.topic_name
  replication_factor = 3
  partitions         = 9
}

