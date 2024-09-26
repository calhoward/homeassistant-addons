#!/usr/bin/with-contenv bashio

# Set Mopidy config paths
export XDG_CONFIG_HOME="/var/lib/mopidy/.config"
export XDG_DATA_HOME="/var/lib/mopidy/.local/share"

# Start Mopidy and keep it running in the background
exec mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf
