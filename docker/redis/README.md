# redis

Quick Start with Redis.

## Boot

Run the redis container with docker compose using:

```bash
docker-compose up -d
```

## Access Redis

You can get the output from the `INFO` command in `redis-cli` using:

```bash
docker exec -it redis redis-cli INFO
```

To write to redis, we can set a key `foo` with the value of `bar` using `set`:

```bash
docker exec -it redis redis-cli set foo bar
```

We can then retrieve the value of `foo` using `get`:

```bash
docker exec -it redis redis-cli get foo
```

Which returns:

```
"bar"
```

## Tear Down

We can stop the container using:

```bash
docker-compose down
```