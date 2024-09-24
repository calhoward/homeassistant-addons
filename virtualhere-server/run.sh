#!/usr/bin/with-contenv bashio

echo "Starting VirtualHere USB Server"

# Log the current devices to check if they're passed correctly
bashio::log.info "Configured devices: $(bashio::config 'devices')"

# Start VirtualHere USB Server
if bashio::config.has_value 'devices'; then
  # If devices are defined, bind only those devices
  device_list=$(bashio::config 'devices')
  for device in $device_list; do
    bashio::log.info "Exposing device: $device"
    /usr/bin/vhusbd -b $device
  done
else
  # Start VirtualHere server normally if no devices are specified
  /usr/bin/vhusbd
fi
