#!/usr/bin/env bash
set -e

# Mopidy configuration file location
CONFIG_PATH=/etc/mopidy/mopidy.conf

# Create a Mopidy configuration file based on Home Assistant's options
cat > $CONFIG_PATH <<EOL
[core]
data_dir = /var/lib/mopidy

[audio]
output = autoaudiosink

[http]
enabled = true
hostname = 0.0.0.0
port = 6680

[spotify]
username = ${SPOTIFY_USERNAME}
password = ${SPOTIFY_PASSWORD}

[local]
enabled = true
media_dir = /media
EOL

# Start Mopidy
mopidy --config $CONFIG_PATH
