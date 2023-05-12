# kafka-with-terraform

## Quick-Start

Boot the kafka cluster:

```bash
docker-compose up -d
```

List the current topics:

```bash
docker exec -it broker-3 kafka-topics --list --bootstrap-server "broker-1:9092,broker-2:9093,broker-3:9094" 
```

Change into terraform's example directory:

```bash
cd example
```

Initialize, plan and apply to create the topics:

```bash
terraform init
terraform plan
terraform apply
```

List topics again:

```bash
docker exec -it broker-3 kafka-topics --list --bootstrap-server "broker-1:9092,broker-2:9093,broker-3:9094"
```

Destroy created topics:

```bash
terraform destroy
```

Destroy kafka cluster:

```bash
cd ..
docker-compose down
```
