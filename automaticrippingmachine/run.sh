#!/usr/bin/env bash
set -e

# Start ARM service in the background
echo "Starting ARM service..."
/sbin/my_init &

# Wait for the ARM web UI to start
echo "Waiting for ARM web UI to start..."
while ! curl -s http://172.30.33.2:8080 > /dev/null; do
  sleep 2
done

# Once the ARM web UI is up, print the confirmation
echo "ARM web UI is ready."

# Keep the container running
# wait
