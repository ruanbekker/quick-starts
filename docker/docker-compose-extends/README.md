# Docker Compose Extends Quick-Start

This quick-start shows how docker-compose's `extends` option enables sharing of common configurations among different files.

## Use Case

There might be a couple of services that follows the same build pattern, or build file, or perhaps just configuration options. 

In this case for one example, we can define how our build context looks like in our `common-services.yml`, eg:

```yaml
  base:
    build:
      context: .
      dockerfile: base.Dockerfile
```

And in our main `docker-compose.yml` we reference the service and compose file to extend our compose:

```yaml
  webapp:
    container_name: webapp
    extends:
      file: common-services.yml
      service: base
```

And in our main `docker-compose.yml` we can provide overrides or just the config that we want.

## Example

This will deploy a python flask and redis application:

```bash
docker-compose --build up -d
```

We can inspect the `webapp` container to see if it has the labels and logging config from the `base` service from the `common-services.yml`:

```bash
docker inspect webapp
```

Which returns something like this:

```json
[
    {
        "Id": "825ea8eeac63c2ee33a334c301984d507d24f7f672be32801ed2d1b623ef4c8b",
        "HostConfig": {
            "LogConfig": {
                "Type": "json-file",
                "Config": {
                    "max-size": "1m"
                }
            },
            "PortBindings": {
                "8000/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "8000"
                    }
                ]
            },
        },
        "Config": {
            "Env": [
                "REDIS_HOST=redis",
                "PYTHONDONTWRITEBYTECODE=1"
            ],
            "Cmd": [
                "/src/boot.sh"
            ],
            "Labels": {
                "com.docker.compose.project": "docker-extends",
                "com.docker.compose.project.config_files": "docker-compose.yml",
                "com.docker.compose.service": "webapp",
                "project.name": "quick-starts"
            }
        },
        ...
        }
    }
]
``` 

So we can confirm that the config was merged.

## Access the Application

Accessing the application:

```bash
curl http://localhost:8000
```

The first request will respond with:

```
This quick-start application has been accessed only 1 time
```

And the second request will respond with:

```
This quick-start application has been accessed 2 times
```

## Resources

- https://github.com/Yelp/docker-compose/blob/master/docs/extends.md
