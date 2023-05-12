# https://kafka-python.readthedocs.io/en/master/#kafkaproducer
import json
import uuid
import os
import time
import random
from faker import Faker
from kafka import KafkaProducer

fake = Faker()

TOPIC = os.environ.get('TOPIC', 'foobar')
BOOTSTRAP_SERVERS = os.environ.get('BOOTSTRAP_SERVERS', 'localhost:9091,localhost:9092,localhost:9093').split(',')

def create_transaction(counter):
    message = {
        'sequence_id': counter,
        'user_id': str(fake.random_int(min=20000, max=100000)),
        'transaction_id': str(uuid.uuid4()),
        'product_id': str(uuid.uuid4().fields[-1])[:5],
        'address': str(fake.street_address() + ' | ' + fake.city() + ' | ' + fake.country_code()),
        'signup_at': str(fake.date_time_this_month()),
        'platform_id': str(random.choice(['Mobile', 'Laptop', 'Tablet'])),
        'message': 'transaction made by userid {}'.format(str(uuid.uuid4().fields[-1]))
    }
    return message

def setup_producer():
    try:
        producer = KafkaProducer(
            bootstrap_servers=BOOTSTRAP_SERVERS,
            value_serializer=lambda v: json.dumps(v).encode('utf-8')
        )
        return producer
    except Exception as e:
        if e == 'NoBrokersAvailable':
            print('waiting for brokers to become available')
        return 'not-ready'

print('setting up producer, checking if brokers are available')
producer='not-ready'

while producer == 'not-ready':
    print('brokers not available yet')
    time.sleep(5)
    producer = setup_producer()

print('brokers are available and ready to produce messages')
counter = 0

while True:
    counter = counter + 1
    json_message = create_transaction(counter)
    producer.send(TOPIC, json_message)
    print('message sent to kafka with squence id of {}'.format(counter))
    time.sleep(2)

producer.close()