resource "aws_dynamodb_table" "orders" {
  name           = "orders"
  read_capacity  = "2"
  write_capacity = "5"
  hash_key       = "OrderID"

  attribute {
    name = "OrderID"
    type = "S"
  }
}
