
### ssh for server

```bash
./generate-keys.sh ec2-1
```

### run

```bash
docker compose up -d
```

### connect

```bash
ssh -i ssh/ec2-1/id_rsa -p 2201 ubuntu@localhost
```

### remove 

```bash
docker system prune -a --volumes
```