# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Disable syslog-ng by removing its init file
RUN rm /etc/my_init.d/10_syslog-ng.init

# Create the missing config directory and ensure the ARM user has the correct permissions
RUN mkdir -p /etc/arm/config && \
    chown -R 1000:1000 /etc/arm

# Install compatible versions of flask, flask_sqlalchemy, and its dependencies
RUN pip3 install werkzeug==1.0.1 flask==1.1.2 jinja2==2.11.3 itsdangerous==1.1.0 markupsafe==1.1.1 flask_sqlalchemy==2.4.4 sqlalchemy==1.3.23

# Remove the udev initialization script to prevent starting it
RUN rm /etc/my_init.d/start_udev.sh

# Set the default entrypoint to ARM's built-in process manager
CMD ["/sbin/my_init"]
