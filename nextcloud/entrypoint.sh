#!/bin/bash
set -e

# If DAPPMANAGER injected a dynDNS domain, append it to NEXTCLOUD_TRUSTED_DOMAINS
if [ -n "${_DAPPNODE_GLOBAL_DOMAIN}" ]; then
  export NEXTCLOUD_TRUSTED_DOMAINS="${NEXTCLOUD_TRUSTED_DOMAINS:-nextcloud.dappnode} ${_DAPPNODE_GLOBAL_DOMAIN}"
fi

# Hand off to the official Nextcloud entrypoint
exec /entrypoint.sh apache2-foreground
