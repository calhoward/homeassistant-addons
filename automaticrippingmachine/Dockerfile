# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Disable syslog-ng by removing its init file
RUN rm /etc/my_init.d/10_syslog-ng.init

# Create the missing config directory and ensure the ARM user has the correct permissions
RUN mkdir -p /etc/arm/config && \
    chown -R 1000:1000 /etc/arm

# Run udevd in the foreground to ensure the service is available inside the container
RUN /lib/systemd/systemd-udevd --daemon && udevadm trigger

# Set the default entrypoint to ARM's built-in process manager
CMD ["/sbin/my_init"]
