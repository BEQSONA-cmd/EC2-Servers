
### ssh keys for server

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

### for find ip address

```Bash
docker inspect ec2-2 | grep IPAddress
```

### remove 

```bash
docker system prune -a --volumes
```

## guide for running it online via Cloudflare Tunnel

### install cloudflare 

```Bash
curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o cloudflared
chmod +x cloudflared
sudo mv cloudflared /usr/local/bin/
```

### login and assign which domain you want to use for tunnel

```Bash
cloudflared tunnel login
```

### create tunnel 

```Bash
cloudflared tunnel create ec2-servers
```

### you can find tunnel id with

```Bash
cloudflared tunnel list
```

### create config file 

```Bash
vim ~/.cloudflared/config.yml
```

### with this configurations

```yaml
tunnel: tunnel-id
credentials-file: /home/<user>/.cloudflared/<tunnel-id>.json

ingress:
  - hostname: ec2-1.<yourdomain.com>
    service: ssh://localhost:2201
  
  - hostname: ec2-2.<yourdomain.com>
    service: ssh://localhost:2202
  
  - service: http_status:404
```



### before running the tunnel you need to add new dns records
 **type** will be **CNAME** and **name** will be **"*"** 
 
 **target** should be **(tunnel_id).cfargotunnel.com**
 


### when the containers are working run the tunnel with 

```Bash
cloudflared tunnel run ec2-servers
```

### and you can connect from any device from any network to your ec2 server from ANYWHERE 

```Bash
ssh -i your-key ubuntu@ec2-1.<yourdomain.com>
```
