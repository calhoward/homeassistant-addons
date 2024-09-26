#!/bin/bash

# Create Mopidy configuration if not exists
mkdir -p /root/.config/mopidy
cat << EOF > /root/.config/mopidy/mopidy.conf
[core]
cache_dir = /root/.cache/mopidy
data_dir = /root/.local/share/mopidy
config_dir = /root/.config/mopidy

[http]
hostname = 0.0.0.0
port = ${INGRESS_PORT:-6680}
default_app = iris

[iris]
enabled = true

[audio]
output = autoaudiosink
EOF

# Run Mopidy
exec mopidy --config /root/.config/mopidy/mopidy.conf
