# https://kafka-python.readthedocs.io/en/master/#kafkaproducer
import json
import os
import time
from datetime import datetime
from kafka import KafkaConsumer

TOPIC = os.environ.get('TOPIC', 'foobar')
CONSUMER_GROUP = os.environ.get('CONSUMER_GROUP', 'cg-group-id')
BOOTSTRAP_SERVERS = os.environ.get('BOOTSTRAP_SERVERS', 'localhost:9091,localhost:9092,localhost:9093').split(',')

print('start')

def setup_consumer():
    try:
        consumer = KafkaConsumer(
            TOPIC,
            bootstrap_servers = BOOTSTRAP_SERVERS,
            auto_offset_reset = 'latest', # 'earliest' # https://stackoverflow.com/a/64829426 | https://github.com/confluentinc/confluent-kafka-python/issues/137
            enable_auto_commit = True,
            group_id = CONSUMER_GROUP,
            value_deserializer = lambda x : json.loads(x.decode('utf-8'))
        )
        return consumer
    
    except Exception as e:
        if e == 'NoBrokersAvailable':
            print('waiting for brokers to become available')
        return 'not-ready'
    
def time_delta(received_time):
    now = datetime.now().strftime("%s")
    return int(now) - received_time

print('starting consumer, checks if brokers are availabe')
consumer='not-ready'

while consumer == 'not-ready':
    print('brokers not availbe yet')
    time.sleep(5)
    consumer = setup_consumer()

print('brokers are available and ready to consume messages')

for message in consumer:
    try:
        print(message.value)
        #print(f"Received message at: {message.timestamp}")
        #now = datetime.now().strftime("%s")
        #print(f"Current timestamp {now}")
    except Exception as e:
        print('exception ocurred in consumption')
        print(e)

# Close the consumer
print('closing consumer')
consumer.close()

