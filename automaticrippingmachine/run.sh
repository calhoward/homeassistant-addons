#!/usr/bin/with-contenv bash
set -e

# Start the ARM service
echo "Starting ARM service..."
/sbin/my_init &

# Wait for the ARM web UI to start
echo "Waiting for ARM web UI to start..."
while ! curl -s http://127.0.0.1:8080 > /dev/null; do
  sleep 2
done

# ARM web UI is now ready
echo "ARM web UI is ready."
