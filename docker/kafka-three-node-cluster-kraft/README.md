# kafka-three-node-cluster-kraft

Kafka cluster using docker compose with KRaft mode (Kafka Raft metadata mode), which eliminates the need for zookeeper.

## Usage

Boot the cluster with:

```bash
docker-compose up -d
```

Run a client container:

```bash
docker run -it --network=kafka -e BOOTSTRAP_SERVERS="kafka1:9092,kafka2:9092,kafka3:9092" --entrypoint="" confluentinc/cp-kafka:7.4.3 bash
```

Create a topic named `foobar`:

```bash
kafka-topics --bootstrap-server "$BOOTSTRAP_SERVERS" --create --topic foobar --partitions 1 --replication-factor 3 --if-not-exists
# Created topic foobar.
```

List topics:

```bash
kafka-topics --list --bootstrap-server "$BOOTSTRAP_SERVERS"
# foobar
```

Describe the topic named `foobar`:

```bash
kafka-topics --describe --bootstrap-server "$BOOTSTRAP_SERVERS" --topic foobar
# Topic: foobar	TopicId: V5vltO3WTZi2p1vyUY7mIw	PartitionCount: 1	ReplicationFactor: 3	Configs:
# 	Topic: foobar	Partition: 0	Leader: 1	Replicas: 1,2,3	Isr: 1,2,3
```

Produce a message to the topic:

```bash
echo "test1" | kafka-console-producer --bootstrap-server "$BOOTSTRAP_SERVERS" --topic foobar
```

Consume messages from the topic:

```bash
kafka-console-consumer --bootstrap-server "$BOOTSTRAP_SERVERS" --topic foobar --from-beginning
# test1
# Processed a total of 1 messages
```
