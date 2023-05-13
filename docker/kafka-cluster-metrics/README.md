# kafka-metrics in grafana

This will boot up a 3 node kafka cluster with grafana, prometheus and the kafka-exporter

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

Access Grafana:
- http://localhost:3000
