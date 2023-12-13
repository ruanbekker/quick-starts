# docker-spark-cluster

This is a quick start with Apache Spark and a example word count.

## Usage

Boot the cluster:

```bash
docker compose up -d 
```

Run a word count:

```bash
docker-compose exec spark-master spark-submit --master spark://spark-master:7077 /src/application.py
```

The output:

```bash
23/12/13 11:59:30 INFO TaskSchedulerImpl: Adding task set 3.0 with 2 tasks resource profile 0
23/12/13 11:59:30 INFO TaskSetManager: Starting task 0.0 in stage 3.0 (TID 4) (172.20.0.3, executor 1, partition 0, NODE_LOCAL, 7185 bytes)
23/12/13 11:59:30 INFO TaskSetManager: Starting task 1.0 in stage 3.0 (TID 5) (172.20.0.3, executor 1, partition 1, NODE_LOCAL, 7185 bytes)
23/12/13 11:59:30 INFO BlockManagerInfo: Added broadcast_3_piece0 in memory on 172.20.0.3:42395 (size: 5.9 KiB, free: 434.3 MiB)
23/12/13 11:59:30 INFO TaskSetManager: Finished task 0.0 in stage 3.0 (TID 4) in 78 ms on 172.20.0.3 (executor 1) (1/2)
23/12/13 11:59:30 INFO TaskSetManager: Finished task 1.0 in stage 3.0 (TID 5) in 78 ms on 172.20.0.3 (executor 1) (2/2)
23/12/13 11:59:30 INFO TaskSchedulerImpl: Removed TaskSet 3.0, whose tasks have all completed, from pool
23/12/13 11:59:30 INFO DAGScheduler: ResultStage 3 (collect at /src/application.py:19) finished in 0.088 s
23/12/13 11:59:30 INFO DAGScheduler: Job 1 is finished. Cancelling potential speculative or zombie tasks for this job
23/12/13 11:59:30 INFO TaskSchedulerImpl: Killing all running tasks in stage 3: Stage finished
23/12/13 11:59:30 INFO DAGScheduler: Job 1 finished: collect at /src/application.py:19, took 0.090312 s
...
over: 2
Fiction: 1
special: 1
permission: 1
Total number of words: 810
```

## Screenshots

The spark ui on http://localhost:8080 

![image](https://github.com/ruanbekker/quick-starts/assets/567298/973cf7fb-15af-4866-a35b-e6d71fbbfac0)


## Resources

- https://github.com/bitnami/containers/tree/main/bitnami/spark
