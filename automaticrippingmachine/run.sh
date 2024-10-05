#!/usr/bin/env bash
set -e

# Export necessary environment variables if needed
# export SOME_VARIABLE=value

# Start Automatic Ripping Machine
exec /usr/local/bin/arm "$@"
