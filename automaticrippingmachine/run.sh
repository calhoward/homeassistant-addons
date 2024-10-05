#!/usr/bin/execlineb -P

# Start ARM service using S6
with-contenv bash -c '
  set -e
  echo "Starting ARM service..."
  /sbin/my_init &

  # Wait for the ARM web UI to start
  echo "Waiting for ARM web UI to start..."
  while ! curl -s http://127.0.0.1:8080 > /dev/null; do
    sleep 2
  done

  # Signal readiness
  echo "ARM web UI is ready."
'
