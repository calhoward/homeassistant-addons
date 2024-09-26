# Base image for Home Assistant Add-ons
ARG BUILD_FROM
FROM $BUILD_FROM

# Install necessary packages for Mopidy
RUN apk add --no-cache \
    mopidy \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-bad \
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

# Set up Mopidy directories
RUN mkdir -p /var/lib/mopidy/.config/mopidy /var/lib/mopidy/.local/share/mopidy

# s6 overlay service setup
COPY run.sh /etc/services.d/mopidy/run
COPY finish.sh /etc/services.d/mopidy/finish

RUN chmod +x /etc/services.d/mopidy/run /etc/services.d/mopidy/finish

# Expose the Mopidy HTTP port (default: 6680)
EXPOSE 6680

# Entry point for s6-overlay
ENTRYPOINT [ "/init" ]
