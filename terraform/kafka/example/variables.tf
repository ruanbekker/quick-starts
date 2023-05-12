variable "bootstrap_servers" {
  type = list(string)
  default = ["127.0.0.1:9092", "127.0.0.1:9093", "127.0.0.1:9094"]
}

variable "topic_name" {
  type = string
  default = "test123"
}
