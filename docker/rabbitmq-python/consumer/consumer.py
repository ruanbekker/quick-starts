import pika
import os
import time
import sys

RABBITMQ_HOST = os.getenv('RABBITMQ_HOST', 'localhost')

try:
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=RABBITMQ_HOST))
    channel = connection.channel()
except pika.exceptions.AMQPConnectionError:
    print(f"Could not connect to RabbitMQ at {RABBITMQ_HOST}")
    sys.exit(1)

channel.queue_declare(queue='hello')

def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)

channel.basic_consume(queue='hello', on_message_callback=callback, auto_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()

