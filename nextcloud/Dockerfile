ARG UPSTREAM_VERSION
ARG VERSION=${UPSTREAM_VERSION#v}
FROM nextcloud:${VERSION}-apache

# Configure Apache to listen on port 8034 instead of 80
RUN sed -i 's/Listen 80/Listen 8034/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8034>/' /etc/apache2/sites-available/*.conf

# Add Redis caching configuration for Nextcloud
# The official image merges files from /usr/src/nextcloud/config/ on startup
RUN { \
  echo '<?php'; \
  echo '$CONFIG = array('; \
  echo '  "memcache.local" => "\\OC\\Memcache\\APCu",'; \
  echo '  "memcache.distributed" => "\\OC\\Memcache\\Redis",'; \
  echo '  "memcache.locking" => "\\OC\\Memcache\\Redis",'; \
  echo '  "redis" => array('; \
  echo '    "host" => getenv("REDIS_HOST") ?: "localhost",'; \
  echo '    "port" => (int)(getenv("REDIS_HOST_PORT") ?: 6379),'; \
  echo '  ),'; \
  echo ');'; \
} > /usr/src/nextcloud/config/redis.config.php

EXPOSE 8034

# Self-healing entrypoint wrapper: runs `occ upgrade` on every boot before
# delegating to the upstream Nextcloud entrypoint. This fixes the case where
# a previous upgrade was interrupted after code sync but before DB migrations,
# leaving the instance stuck in maintenance mode with matching versions.
COPY docker-entrypoint.dappnode.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.dappnode.sh
ENTRYPOINT ["docker-entrypoint.dappnode.sh"]
