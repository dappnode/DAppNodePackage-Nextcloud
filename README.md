# DAppNodePackage-nextcloud

[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.admin.dnp.dappnode.eth/#/installer/nextcloud.dnp.dappnode.eth)

Nextcloud on DAppNode — self-hosted cloud storage, calendar, contacts, and collaboration platform with MariaDB and Redis.

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

On your first visit, Nextcloud will show its setup wizard where you create your admin account. The database connection is pre-configured — no extra setup needed.

## Building locally

```bash
docker-compose build
```

## Running locally

```bash
docker-compose up -d
docker-compose logs -f
```

## Stopping

```bash
docker-compose down
```

## License

This package uses the [AGPL-3.0](LICENSE) license, matching Nextcloud's upstream license.
