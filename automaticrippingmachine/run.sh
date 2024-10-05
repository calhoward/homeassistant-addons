#!/usr/bin/env bash
set -e

# Start ARM (this is the command to start ARM, make sure it's correct)
echo "Starting ARM service..."

# Start the ARM service
/sbin/my_init &

# Wait until the ARM web UI is ready
echo "Waiting for ARM web UI to start..."
while ! curl -s http://127.0.0.1:8080 > /dev/null; do
  sleep 2
done

# Signal to Home Assistant that the service is ready
echo "ARM web UI is ready."

# Keep the container running
wait
