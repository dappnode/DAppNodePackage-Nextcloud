# Nextcloud Server for Dappnode

[![DAppStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.dappnode/installer/nextcloud.dnp.dappnode.eth)

Nextcloud on Dappnode — self-hosted cloud storage, calendar, contacts, and collaboration platform with MariaDB and Redis.

## Architecture

This package runs **3 containers**:

| Service       | Image                  | Purpose                              |
|---------------|------------------------|--------------------------------------|
| `nextcloud`   | `nextcloud:33-apache`  | Nextcloud web app (Apache)           |
| `db`          | `mariadb:11`           | MariaDB database                     |
| `redis`       | `redis:7-alpine`       | Caching and file locking             |

## Getting started

After installing, open the Nextcloud UI at:

```
http://nextcloud.dappnode:8034
```

## License

This package uses the [AGPL-3.0](LICENSE) license, matching Nextcloud's upstream license.
