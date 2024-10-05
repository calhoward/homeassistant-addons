# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Ensure the system has /bin/bash in case it's missing
RUN apt-get update && apt-get install -y bash

# Remove udev and syslog-ng to prevent errors
RUN rm -f /etc/my_init.d/start_udev.sh
RUN rm -f /etc/my_init.d/10_syslog-ng.init

# Install the S6 Overlay to manage the service lifecycle
RUN curl -L -o /tmp/s6-overlay.tar.gz https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64.tar.gz \
    && tar -xzf /tmp/s6-overlay.tar.gz -C / \
    && rm /tmp/s6-overlay.tar.gz

# Create config directory and set correct permissions for ARM
RUN mkdir -p /etc/arm/config && chown -R 1000:1000 /etc/arm

# Install compatible Flask and SQLAlchemy versions
RUN pip3 install werkzeug==1.0.1 flask==1.1.2 jinja2==2.11.3 itsdangerous==1.1.0 markupsafe==1.1.1 flask_sqlalchemy==2.4.4 sqlalchemy==1.3.23

# Copy the run.sh startup script for S6
COPY run.sh /etc/services.d/arm/run

# Make the startup script executable
RUN chmod +x /etc/services.d/arm/run

# Set the entrypoint to use the S6 init system
ENTRYPOINT ["/init"]
