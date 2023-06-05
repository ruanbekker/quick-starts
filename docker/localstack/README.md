# localstack quick-start

## Usage

Run localstack:

```bash
docker-compose up -d
```

or:

```bash
make up
```

View the status:

```bash
make open
```

or visit http://localhost:4566/health

Make aws calls against localstack:

```bash
docker exec -it localstack bash
export AWS_ACCESS_KEY_ID="quick-start"
export AWS_SECRET_ACCESS_KEY="quick-start"
aws --region us-east-1 --endpoint-url=http://127.0.0.1:4566 kinesis list-streams
```

## Documentation

- https://docs.localstack.cloud/overview/
