# gitea-quick-start

This is a quick-start on docker for gitea and gitea actions.

## Usage

Boot the stack:

```bash
docker compose up -d
```

Generate a runner token:

```bash
docker exec -it --user git gitea gitea --config /data/gitea/conf/app.ini actions generate-runner-token
```

Then you can define the value as an environment variable `GITEA_RUNNER_REGISTRATION_TOKEN` for your gitea-runner container.

From [this](https://docs.gitea.com/usage/actions/quickstart#use-actions) page they show that you need to enable your repository actions:

- Settings
- Repository
- Advanced Settings
- Then enable "Actions: Enable Repository Actions"

Commit a workflow yaml file `.gitea/workflows/default.yml`:

```yaml
name: quickstart gitea actions
run-name: ${{ gitea.actor }} is testing out actions
on: [push]
jobs:
  quickstart-actions:
    container:
      image: alpine:latest
    runs-on: quickstart
    steps:
      - name: checks out repository
        uses: actions/checkout@v4
      - name: list files in the repository
        run: |
          ls ${{ github.workspace }}
```

Screenshot:

![image](https://github.com/ruanbekker/quick-starts/assets/567298/b7c6f34d-27fe-4619-81fd-dfbf8e11e53c)


## Resources

- [gitea actions quickstart](https://docs.gitea.com/usage/actions/quickstart)
- [gitea config - actions](https://docs.gitea.com/administration/config-cheat-sheet#actions-actions)
- [gitea actions - act runner](https://docs.gitea.com/usage/actions/act-runner)
- [gitea actions kubernetes example](https://gitea.com/gitea/helm-chart/issues/459#issuecomment-750723)


