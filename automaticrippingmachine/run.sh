#!/usr/bin/env bash
set -e

# Export necessary environment variables if needed
# Example:
# export ARM_CONFIG_PATH=/config/arm_config.yaml

# Start Automatic Ripping Machine
exec /usr/local/bin/arm "$@"
