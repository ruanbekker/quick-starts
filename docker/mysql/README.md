# mysql quickstart

This is the mysql quick-start

## Boot the Stack

Boot the mysql container:

```bash
docker-compose up -d
```

## MySQL Examples

Logon to the mysql server:

```bash
docker exec -it mysql mysql -u root -prootpassword
```

List the databases:

```bash
show databases;
```
