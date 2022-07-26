from flask import Flask, g, request
from redis import Redis
import datetime
import time
import logging
from logging.config import dictConfig
import os

dictConfig({
    'version': 1,
    'formatters': {
        'default': {
            'format': '%(asctime)s.%(msecs)03d, %(levelname)s, %(message)s',
            'datefmt': '%Y-%m-%dT%H:%M:%S'
        },
    },
    'handlers': {
        'stdout': {
            'class': "logging.StreamHandler",
            'stream': 'ext://sys.stdout',
            'formatter': 'default'
        }
    },
    'root': {
        'handlers': ['stdout'],
        'level': os.getenv('APP_LOG_LEVEL', 'INFO')},
})

app = Flask(__name__)
redis = Redis(host=os.environ['REDIS_HOST'], port=6379)

@app.before_request
def start_timer():
    g.start = time.time()

@app.after_request
def log_request(response):
    if (
        request.path == "/favicon.ico"
        or request.path.startswith("/static")
    ):
        return response

    now = time.time()
    duration = round(now - g.start, 6)
    ip_address = request.headers.get("X-Forwarded-For", request.remote_addr)
    host = request.host.split(":", 1)[0]
    params = dict(request.args)
    request_id = request.headers.get("X-Request-ID", "")
    log_params = {
        "method": request.method,
        "path": request.path,
        "status": response.status_code,
        "duration": duration,
        "ip": ip_address,
        "host": host,
        "params": params,
        "request_id": request_id
    }
    app.logger.info(log_params)
    return response

@app.route('/', methods=['GET'])
def hello():
   res = redis.incr('hits')
   if res == 1:
       return f'This quick-start application has been accessed only {res} time\n'
   else:
       return f'This quick-start application has been accessed {res} times\n'

if __name__ == "__main__":
   app.run(debug=False)
