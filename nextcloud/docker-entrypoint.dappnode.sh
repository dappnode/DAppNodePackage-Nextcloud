#!/bin/sh

# Self-heal interrupted upgrades: if Nextcloud is already installed but a
# previous upgrade was interrupted after code sync but before DB migrations,
# the upstream entrypoint will not retry because the version numbers already
# match. Run occ upgrade unconditionally here (it is idempotent) so the
# instance can boot out of maintenance mode by itself.
if [ -f /var/www/html/occ ]; then
    su -p www-data -s /bin/sh -c '/usr/local/bin/php /var/www/html/occ upgrade' || true
fi

exec /entrypoint.sh "$@"
