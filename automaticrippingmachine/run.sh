#!/usr/bin/env bash
# Automatic Ripping Machine (ARM) Add-on Run Script

echo "Starting Automatic Ripping Machine (ARM)..."

# Set timezone environment variable
export TZ=${TZ}

# Run ARM with the provided options from the Home Assistant config
docker-entrypoint.sh
