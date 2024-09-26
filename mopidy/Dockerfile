# Use the Home Assistant base image
ARG BUILD_FROM
FROM $BUILD_FROM

# Install Mopidy and its dependencies from Alpine's edge repository
RUN apk add --no-cache \
    mopidy \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    gst-libav \
    py3-dbus \
    py3-gst \
    py3-libxml2 \
    py3-pykka \
    py3-requests \
    py3-setuptools \
    py3-tornado \
    pulseaudio \
    bash

# Set up Mopidy configuration directory
RUN mkdir -p /var/lib/mopidy/.config/mopidy

# Copy the run script to manage the service
COPY run.sh /etc/services.d/mopidy/run
RUN chmod +x /etc/services.d/mopidy/run

# Expose the Mopidy web port
EXPOSE 6680

# Use s6-overlay to manage services
ENTRYPOINT [ "/init" ]
