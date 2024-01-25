# mini-traefik

A minimal [Traefik](https://traefik.io/) setup for Https certificates generation and renewal demo.

## Usage

1. Clone this repository
2. Run `cp .env.example .env` and edit the `.env` file to your needs.
3. Point your domain to the server ip address.
4. Run `make rsync` to push the configuration to server.
5. Run `make start` to (re)start the containers.
6. Wait a bit for the certificates to be generated, and then you should be able to access your services through https.

### ufw

```bash
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw allow from 172.18.0.0/16 # check this by `docker network inspect traefik-proxy`
sudo ufw enable
```
