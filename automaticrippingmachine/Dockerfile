# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Remove syslog-ng and udev to prevent errors
RUN rm -f /etc/my_init.d/10_syslog-ng.init
RUN rm -f /etc/my_init.d/start_udev.sh

# Optionally, remove the syslog-ng package entirely (if present)
RUN apt-get remove -y syslog-ng-core || true

# Create config directory and set correct permissions for ARM
RUN mkdir -p /etc/arm/config && chown -R 1000:1000 /etc/arm

# Install compatible Flask and SQLAlchemy versions
RUN pip3 install werkzeug==1.0.1 flask==1.1.2 jinja2==2.11.3 itsdangerous==1.1.0 markupsafe==1.1.1 flask_sqlalchemy==2.4.4 sqlalchemy==1.3.23

# Copy the run.sh startup script
COPY run.sh /run.sh

# Make the startup script executable
RUN chmod +x /run.sh

# Set the entrypoint to execute the run.sh script
ENTRYPOINT ["/bin/bash", "/run.sh"]
