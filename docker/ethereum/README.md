# ethereum quick-start

This spins up geth and prysm in the sepolia testnet.

## Usage

Create the shared secret:

```bash
openssl rand -hex 32 | tr -d "\n" > "jwt.hex"
```

Start the containers:

```bash
docker-compose up -d
```

View the logs:

```bash
docker-compose logs -f
```

View the sync progress:

```bash
curl -s -XPOST -H 'Content-Type: application/json' --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":1}' http://127.0.0.1:8545
```

