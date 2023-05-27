# code-server

Runs VSCode in a UI

## Usage

Make targets available:

```bash
make

help                           This help.
up                             Runs the containers in detached mode
clean                          Stops and removes all containers
logs                           View the logs from the containers
open                           Opens tabs in container
```

Run:

```bash
make up
```

Access code-server:

```bash
make open
```

Tear down:

```bash
make clean
```


