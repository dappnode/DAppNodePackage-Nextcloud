ARG UPSTREAM_VERSION
FROM nextcloud:${UPSTREAM_VERSION}

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
