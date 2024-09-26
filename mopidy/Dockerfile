# Use the Home Assistant base image
ARG BUILD_FROM
FROM $BUILD_FROM

# Install Mopidy and dependencies
RUN apk add --no-cache \
    mopidy \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-ugly \
    py3-dbus \
    py3-gst \
    py3-libxml2 \
    py3-pykka \
    py3-requests \
    py3-setuptools \
    py3-tornado \
    pulseaudio \
    bash

# Set up Mopidy config and data directories
RUN mkdir -p /var/lib/mopidy/.config/mopidy /var/lib/mopidy/.local/share/mopidy

# Expose Mopidy port for external access (if needed)
EXPOSE 6680

# Copy the service script to manage Mopidy via s6-overlay
COPY run.sh /etc/services.d/mopidy/run
RUN chmod +x /etc/services.d/mopidy/run

# Use s6-overlay for process management
ENTRYPOINT [ "/init" ]
