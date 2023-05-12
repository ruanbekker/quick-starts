# kafka in docker

## Quick Start

Boot the stack:

```bash
docker-compose up --build -d
```

Tail the producer logs:

```bash
docker logs -f producer
```

Tail the consumer logs:

```bash
docker logs -f consumer
```

## Other Examples

List:

```bash
docker run --network host -it --rm edenhill/kcat:1.7.1 -b 127.0.0.1:9091 -L
```

Produce:

```bash
docker run --network host -i --rm edenhill/kcat:1.7.1 -b 127.0.0.1:9091 -t test -K: -P <<EOF
1:{"order_id":853,"order_ts":1683931247,"amount":12.52,"customer_name":"Ruan Bekker"}
2:{"order_id":854,"order_ts":1683931258,"amount":0.99,"customer_name":"James Frank"}
3:{"order_id":855,"order_ts":1683931271,"amount":24.95,"customer_name":"Peter Smith"}
EOF
```

Consume:

```bash
docker run --network host -i --rm edenhill/kcat:1.7.1 -b 127.0.0.1:9091 -C -f '\nKey (%K bytes): %k\t\nValue (%S bytes): %s\n\Partition: %p\tOffset: %o\n--\n' -t test
```

Exec the shell:

```bash
docker exec -it kafka-shell bash
export BOOTSTRAP_SERVER="kafka1:9091,kafka2:9092,kafka3:9093"
```

List topics:

```bash
kafka-topics --list --bootstrap-server "$BOOTSTRAP_SERVERS"
```

Create topic:

```bash
kafka-topics --bootstrap-server "$BOOTSTRAP_SERVERS" --create --topic foobar --partitions 1 --replication-factor 3 --if-not-exists
```

Produce a message:

```bash
echo "test1" | kafka-console-producer --bootstrap-server "$BOOTSTRAP_SERVERS" --topic foobar
```

Consume a message:

```bash
kafka-console-consumer --bootstrap-server "$BOOTSTRAP_SERVERS" --topic foobar --from-beginning
```

Messages in topic:

```bash
kafka-run-class kafka.tools.GetOffsetShell --bootstrap-server "$BOOTSTRAP_SERVERS" --topic foobar | awk -F  ":" '{sum += $3} END {print "Result: "sum}'
```

## Resources
- https://github.com/edenhill/kcat#examples
