#!/bin/bash
set -e

CONFIG_FILE="/var/www/html/config/config.php"

if [ -n "${_DAPPNODE_GLOBAL_DOMAIN}" ]; then
  if [ -f "${CONFIG_FILE}" ]; then
    # Nextcloud already installed -> patch trusted_domains in config.php directly
    EXISTING_DOMAINS=$(su -s /bin/bash www-data -c "php occ config:system:get trusted_domains" 2>/dev/null || true)

    if ! printf '%s\n' "${EXISTING_DOMAINS}" | grep -qx "${_DAPPNODE_GLOBAL_DOMAIN}"; then
      NEXT_INDEX=$(printf '%s\n' "${EXISTING_DOMAINS}" | grep -c . )
      su -s /bin/bash www-data -c "php occ config:system:set trusted_domains ${NEXT_INDEX} --value=${_DAPPNODE_GLOBAL_DOMAIN}"
    fi
  else
    # First run -> config.php doesn't exist yet, let the official install create it
    export NEXTCLOUD_TRUSTED_DOMAINS="${NEXTCLOUD_TRUSTED_DOMAINS:-nextcloud.dappnode} ${_DAPPNODE_GLOBAL_DOMAIN}"
  fi
fi

# Hand off to the official Nextcloud entrypoint
exec /entrypoint.sh apache2-foreground
