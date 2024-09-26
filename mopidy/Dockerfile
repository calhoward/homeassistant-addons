# Define the base image
ARG BUILD_FROM
FROM $BUILD_FROM

# Set environment variables
ENV LANG C.UTF-8

# Install necessary packages including GStreamer for audio playback
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-setuptools \
    build-base \
    gcc \
    g++ \
    libc-dev \
    pkgconfig \
    python3-dev \
    libffi-dev \
    openssl-dev \
    curl \
    curl-dev \
    glib \
    glib-dev \
    gstreamer \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    pulseaudio \
    gst-libav

# Create a Python virtual environment for Mopidy
RUN python3 -m venv /opt/mopidy-venv

# Activate the virtual environment and install Mopidy
RUN /opt/mopidy-venv/bin/pip install mopidy

# Create service directory for s6-overlay to manage Mopidy as a service
RUN mkdir -p /etc/services.d/mopidy

# Copy the run script into the service directory
COPY run.sh /etc/services.d/mopidy/run
RUN chmod +x /etc/services.d/mopidy/run

# Expose the Mopidy web frontend port (default 6680)
EXPOSE 6680

# Use s6-overlay to manage services
ENTRYPOINT [ "/init" ]
