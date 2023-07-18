import pika
import os
import time
import random

RABBITMQ_HOST = os.getenv('RABBITMQ_HOST', 'localhost')
COUNT = 0

try:
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=RABBITMQ_HOST))
    channel = connection.channel()
except pika.exceptions.AMQPConnectionError:
    print(f"Could not connect to RabbitMQ at {RABBITMQ_HOST}")

channel.queue_declare(queue='hello')

print("starting")
RANDOM_ID = random.randint(1,10000)
while COUNT <= 20:
    COUNT=COUNT+1
    channel.basic_publish(exchange='', routing_key='hello', body=f'[id: {RANDOM_ID} count: {COUNT}] Hello World!')
    print(f" [x] Sent 'Hello World! {COUNT} from {RANDOM_ID}'")
    time.sleep(1)

print("ending")
connection.close()

