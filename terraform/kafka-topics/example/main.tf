module "kafka_topics" {
  source            = "../../kafka"
  bootstrap_servers = var.bootstrap_servers
  topic_name        = var.topic_name
}

