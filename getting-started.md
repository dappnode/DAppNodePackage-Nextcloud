# Nextcloud on DAppNode

## Quick start

1. Open the Nextcloud UI: [http://nextcloud.dappnode:8034](http://nextcloud.dappnode:8034)
2. On your first visit, Nextcloud will show its **setup wizard** — create your admin username and password there.
3. The database is already pre-configured (MariaDB + Redis) — no additional setup needed.

## What's included

- **Nextcloud** — your self-hosted cloud (files, calendar, contacts, office)
- **MariaDB** — reliable database backend
- **Redis** — caching and file locking for better performance

## External access

By default, Nextcloud is only available within your DAppNode network. To access it remotely, use one of DAppNode's built-in network options:

- **Wireguard VPN** — connect your devices from anywhere
- **DAppNode Wi-Fi** — access from your local network
- **HTTPS portal** — expose Nextcloud to the internet with a domain

See the [DAppNode network docs](https://docs.dappnode.io/docs/user/packages/understanding-dappnode-packages/network) for details.

## Maintenance tips

Run Nextcloud CLI commands via:

```
docker exec -it --user www-data nextcloud.nextcloud.dnp.dappnode.eth php occ <command>
```

For example, to scan for new files:

```
docker exec -it --user www-data nextcloud.nextcloud.dnp.dappnode.eth php occ files:scan --all
```
