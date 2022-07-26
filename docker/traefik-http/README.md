# Docker Traefik HTTP Quick Start

This quick-start shows how to run [traefik proxy](https://traefik.io/traefik/) in http mode with a sample web application behind the proxy.

## About Traefik

Traefik is a Modern HTTP Reverse Proxy and Load Balancer that makes deploying microservices easily.

## Usage

Run the containers using:

```bash
docker-compose up -d
```

The `traefik-proxy` will route traffic to the `whoami-app` container when the host header is `whoami.127.0.0.1.nip.io` which is configured with labels on the `whoami-app` container's configuration. You can inspect `docker-compsoe.yml`.

We can test that with:

```bash
curl http://whoami.127.0.0.1.nip.io
```

And the response should be:

```
Hostname: d4b9fcfd4744
IP: 127.0.0.1
IP: 172.23.0.4
RemoteAddr: 172.23.0.2:49012
GET / HTTP/1.1
Host: whoami.127.0.0.1.nip.io
User-Agent: curl/7.64.1
Accept: */*
Accept-Encoding: gzip
X-Forwarded-For: 172.23.0.1
X-Forwarded-Host: whoami.127.0.0.1.nip.io
X-Forwarded-Port: 80
X-Forwarded-Proto: http
X-Forwarded-Server: b8df98295fec
X-Real-Ip: 172.23.0.1
```

## Traefik with other apps

If you would like to use traefik proxy with other containers, you just need to wire it up with similar config on the application container as below:

```yaml
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.whoami.rule=Host(`whoami.127.0.0.1.nip.io`)"
      - "traefik.http.routers.whoami.entrypoints=web"
      - "traefik.http.services.whoami.loadbalancer.server.port=80"
```

In summary:

1. The host header
2. The entrypoint name, defined on traefik-proxy ie. `web`
3. The port that traefik-proxy needs to pass the connection to.

## Resources

- https://traefik.io/traefik/
