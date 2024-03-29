# kind

Kubernetes in Docker Project to run Local Kubernetes Clusters

## Installation

Follow the docs:
- https://kind.sigs.k8s.io/docs/user/quick-start/#installation

### Linux

On Linux, install Docker as it's a dependency:

```bash
curl https://get.docker.com | bash && sudo chmod 666 /var/run/docker.sock
```

Install KinD:

```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
sudo install -o root -g root -m 0755 kind /usr/local/bin/kind
rm kind
```

Install kubectl:

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
```

## Configuration

Configuration docs:
- https://kind.sigs.k8s.io/docs/user/quick-start/
- https://kind.sigs.k8s.io/docs/user/configuration/
