# Use the official Automatic Ripping Machine Docker image as the base
FROM automaticrippingmachine/automatic-ripping-machine:latest

# Remove udev and syslog-ng to prevent issues
RUN rm -f /etc/my_init.d/start_udev.sh
RUN rm -f /etc/my_init.d/10_syslog-ng.init

# Ensure that all required directories and permissions are set for ARM
RUN mkdir -p /etc/arm/config && chown -R 1000:1000 /etc/arm

# Install compatible Flask and SQLAlchemy versions to avoid dependency issues
RUN pip3 install werkzeug==1.0.1 flask==1.1.2 jinja2==2.11.3 itsdangerous==1.1.0 markupsafe==1.1.1 flask_sqlalchemy==2.4.4 sqlalchemy==1.3.23

# Start the ARM service directly using the default entrypoint of the ARM image
CMD ["/sbin/my_init"]
