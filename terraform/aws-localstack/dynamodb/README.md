# localstack-dynamodb quick-start

This will provision a dynamodb table with terraform using localstack to mock the aws infrastructure.

## Usage

Initialize:

```bash
terraform init
```

Plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

<details>
  <summary>Response:</summary>

```terraform
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_dynamodb_table.orders will be created
  + resource "aws_dynamodb_table" "orders" {
      + arn              = (known after apply)
      + billing_mode     = "PROVISIONED"
      + hash_key         = "OrderID"
      + id               = (known after apply)
      + name             = "orders"
      + read_capacity    = 2
      + stream_arn       = (known after apply)
      + stream_label     = (known after apply)
      + stream_view_type = (known after apply)
      + tags_all         = (known after apply)
      + write_capacity   = 5

      + attribute {
          + name = "OrderID"
          + type = "S"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

</details>

List tables using the aws cli on the localstack container:

```bash
docker exec -it localstack awslocal dynamodb list-tables
```

<details>
  <summary>Response:</summary>

```json
{
    "TableNames": [
        "orders"
    ]
}
```

</details>

Create a item into the table:

```bash
docker exec -it localstack awslocal dynamodb put-item --table-name orders --item '{"OrderID": {"S": "order-123"}}'
```

Scan the table to see if the item is in the table:

```bash
docker exec -it localstack awslocal dynamodb scan --table-name orders
```

<details>
  <summary>Response:</summary>

```json
{
    "Items": [
        {
            "OrderID": {
                "S": "order-123"
            }
        }
    ],
    "Count": 1,
    "ScannedCount": 1,
    "ConsumedCapacity": null
}
```

</details>

Destroy the infrastructure:

```bash
terraform destroy
```
