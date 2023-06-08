resource "aws_kinesis_stream" "orders_processor" {
  name = "orders_processor"
  shard_count = 1
  retention_period = 30

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]
}
