# nodejs-express-mongodb-quick-start

This is a quick start of a API using MongoDB usingNodeJS Express 

## Build and Boot the Containers

Build the application, then start mongodb and the api containers:

```bash
docker-compose up --build -d
```

## API Usage

Use a GET request method to list all our entries:

```bash
curl -XGET -H 'Content-Type: application/json' http://localhost:3000/api/
[]
```

Make a POST request method to creating a entry:

```bash
curl -XPOST -H 'Content-Type: application/json' http://localhost:3000/api -d '{"name": "ruan", "age": 34, "hobbies": ["programming", "sport", "guitar"]}'
{"name":"ruan","age":34,"hobbies":["programming","sport","guitar"],"_id":"64727625207410b4cd88ccbb","__v":0}%
```

Make a GET request method again to view our entry:

```bash
curl -XGET -H 'Content-Type: application/json' http://localhost:3000/api
[{"_id":"64727625207410b4cd88ccbb","name":"ruan","age":34,"hobbies":["programming","sport","guitar"],"__v":0}]%
```

We can also view a single entry by making a GET request method against the userid:

```bash
curl -XGET -H 'Content-Type: application/json' http://localhost:3000/api/64727625207410b4cd88ccbb
{"_id":"64727625207410b4cd88ccbb","name":"ruan","age":34,"hobbies":["programming","sport","guitar"],"__v":0}%
```

We can update a entry with a PATCH request method:

```bash
curl -XPATCH -H 'Content-Type: application/json' http://localhost:3000/api/64727625207410b4cd88ccbb -d '{"age": 35}'
{"_id":"64727625207410b4cd88ccbb","name":"ruan","age":35,"hobbies":["programming","sport","guitar"],"__v":0}%
```

We can also delete a entry by using a DELETE request method:

```bash
curl -XDELETE -H 'Content-Type: application/json' http://localhost:3000/api/64727625207410b4cd88ccbb
Document with ruan has been deleted..%
```

## Tear Down

To delete the containers:

```bash
docker-compose down
```
