# mailhog

Mailhog is a email testing tool with a UI.

## Boot

Deploy the container:

```bash
docker-compose up -d
```

Access the UI on http://localhost:8025

## Send Mail

Send the test mail using:

```bash
python3 send_mail.py
```

## Tear Down

Stop the container:

```bash
docker-compose down
```