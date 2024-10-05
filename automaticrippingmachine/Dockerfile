# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Remove udev init script to prevent Docker errors
RUN rm /etc/my_init.d/start_udev.sh

# Create config directory and set correct permissions for ARM
RUN mkdir -p /etc/arm/config && chown -R 1000:1000 /etc/arm

# Install compatible Flask and SQLAlchemy versions
RUN pip3 install werkzeug==1.0.1 flask==1.1.2 jinja2==2.11.3 itsdangerous==1.1.0 markupsafe==1.1.1 flask_sqlalchemy==2.4.4 sqlalchemy==1.3.23

# Install the S6 Overlay for service management
RUN curl -L -o /tmp/s6-overlay.tar.gz https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64.tar.gz \
    && tar -xzf /tmp/s6-overlay.tar.gz -C / \
    && rm /tmp/s6-overlay.tar.gz

# Copy the run.sh startup script
COPY run.sh /run.sh

# Make the startup script executable
RUN chmod +x /run.sh

# Set S6 as the entrypoint
ENTRYPOINT ["/init"]
