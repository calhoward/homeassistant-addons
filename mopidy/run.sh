#!/usr/bin/with-contenv bashio

# Set up Mopidy configuration and data directories
export XDG_CONFIG_HOME="/var/lib/mopidy/.config"
export XDG_DATA_HOME="/var/lib/mopidy/.local/share"

# Run Mopidy
exec mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf
