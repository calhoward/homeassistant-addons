# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Disable syslog-ng by removing its init file
RUN rm /etc/my_init.d/10_syslog-ng.init

# Create the missing config directory and ensure the ARM user has the correct permissions
RUN mkdir -p /etc/arm/config && \
    chown -R 1000:1000 /etc/arm

# Install a compatible version of werkzeug
RUN pip3 install werkzeug==1.0.1

# Remove the udev initialization script to prevent starting it
RUN rm /etc/my_init.d/start_udev.sh

# Set the default entrypoint to ARM's built-in process manager
CMD ["/sbin/my_init"]
