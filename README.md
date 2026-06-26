
### ssh for server

```bash
./generate-keys.sh ec2-1
./generate-keys.sh ec2-2
```

### run

```bash
docker compose up -d
```

### connect to ec2-1

```bash
ssh -i ssh/ec2-1/id_rsa -p 2201 ubuntu@localhost
```

### connect to ec2-2

```bash
ssh -i ssh/ec2-2/id_rsa -p 2202 ubuntu@localhost
```

### remove 

```bash
docker system prune -a --volumes
```