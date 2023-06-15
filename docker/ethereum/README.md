# ethereum quick-start

This spins up geth and prysm in the sepolia testnet.

## Usage

Create the shared secret:

```bash
openssl rand -hex 32 | tr -d "\n" > "jwt.hex"
```

Create the wallet password for the validator:

```bash
mkdir -p data/prysm-wallet
openssl rand -hex 32 | tr -d "\n" > data/prysm-wallet/password.txt
```

Create the wallet:

```bash
docker run -it -v $PWD/data/prysm-wallet:/wallet gcr.io/prysmaticlabs/prysm/validator:stable \
  wallet create --wallet-dir=/wallet --keymanager-kind=derived \
  --wallet-password-file=/wallet/password.txt \
  --accept-terms-of-use --sepolia
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

## Resources

- [Go-Eth](https://geth.ethereum.org/docs)
- [Prysm](https://docs.prylabs.network/docs/getting-started)
- [Ethereum JSON-RPC API](https://ethereum.org/en/developers/docs/apis/json-rpc)
