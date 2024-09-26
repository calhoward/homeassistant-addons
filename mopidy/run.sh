#!/usr/bin/with-contenv bashio

# Set Mopidy config paths
export XDG_CONFIG_HOME="/var/lib/mopidy/.config"
export XDG_DATA_HOME="/var/lib/mopidy/.local/share"

# Run Mopidy as a service without taking over PID 1
exec mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf
