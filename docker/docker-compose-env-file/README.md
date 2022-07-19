# docker-compose env-file

Example on how to use env_file in docker-compose

## Use Cases

There will be 3 scenarios:

1. The app en db container shares the same environment variables from `config/.env`
2. With the extra `environment` section on the app container we can overwrite the value of `APP_DEBUG` from the `config/.env` file
3. We have an extra `config/.env_extra` which is read by only the app container

## Run it

Run the containers:

```bash
docker-compose up -d
```

Run the `env` commands in the container `app` to view its environment variables:

```bash
docker exec app env

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=b3ac14fa53fc
APP_ENV=test
APP_CONNECTION=remote
APP_DEBUG=false
MYSQL_USER=app
MYSQL_PASSWORD=password
MYSQL_DATABASE=appdb
EXTRAS=foobar
HOME=/root
```

Run the `env` commands in the container `db` to view its environment variables:

```bash
docker exec db env

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=57b646da8263
APP_ENV=test
APP_CONNECTION=remote
APP_DEBUG=true
MYSQL_USER=app
MYSQL_PASSWORD=password
MYSQL_DATABASE=appdb
HOME=/root
```

Stop the containers:

```bash
docker-compose down
```
