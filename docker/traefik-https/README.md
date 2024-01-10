# Docker Traefik HTTPS Quick Start

This quick-start shows how to run [traefik proxy](https://traefik.io/traefik/) in https mode with letsencrypt and a sample web application behind the proxy.

## About Traefik

Traefik is a Modern HTTP Reverse Proxy and Load Balancer that makes deploying microservices easily.

## Note

This quick-start uses http challenge for letsencrypt, so that means we should have a direct / public http route to our service in order to complete the http challenge.

## Usage

Run the containers using:

```bash
docker-compose up -d
```

The `traefik-proxy` will route traffic to the `whoami-app` container when the host header is `whoami.example.com` which is configured with labels on the `whoami-app` container's configuration. You can inspect `docker-compsoe.yml`.

We can test that with:

```bash
curl https://whoami.example.com
```

And the response should be:

```bash
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
      - "traefik.http.routers.whoami.rule=Host(`whoami.example.com`)"
      - "traefik.http.routers.whoami.service=whoami"
      - "traefik.http.services.whoami.loadbalancer.server.port=80"
      - "traefik.http.routers.whoami.entrypoints=websecure"
      - "traefik.http.routers.whoami.tls=true"
      - "traefik.http.routers.whoami.tls.certresolver=letsencrypt"
```

In summary:

1. The host header
2. The entrypoint name, defined on traefik-proxy ie. `websecure`
3. The port that traefik-proxy needs to pass the connection to.

## Resources

- https://traefik.io/traefik/
