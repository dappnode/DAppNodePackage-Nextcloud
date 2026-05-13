# Nextcloud on Dappnode

## Quick start

1. Open the Nextcloud UI: [http://nextcloud.dappnode:8034](http://nextcloud.dappnode:8034)
2. On your first visit, Nextcloud will show its **setup wizard** — create your admin username and password there.
3. The database is already pre-configured (MariaDB + Redis) — no additional setup needed.
4.  Check the "Network" tab in the package if you want to expose endpoints via HTTPS.

## What's included

- **Nextcloud** — your self-hosted cloud (files, calendar, contacts, office)
- **MariaDB** — reliable database backend
- **Redis** — caching and file locking for better performance

## External access

By default, Nextcloud is only available within your Dappnode network. To access it remotely, use one of Dappnode's built-in network options:

- **VPN** — connect your devices from anywhere using Wireguard, Tailscale or OpenVPN.
- **Wi-Fi** — access from your local network.
- **HTTPS portal** — expose Nextcloud to the internet with a domain. See the [Dappnode network docs](https://docs.dappnode.io/docs/user/packages/understanding-dappnode-packages/network) for details.

Once done, configure and sync your devices via WebDAV, CalDAV and any other sync tools you'd like.
