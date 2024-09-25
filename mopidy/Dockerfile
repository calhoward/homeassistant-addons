ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install core dependencies and GStreamer plugins
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

# Create a Python virtual environment
RUN python3 -m venv /opt/mopidy-venv

# Activate the virtual environment and install Mopidy and modern mopidy-spotify
# Use mopidy-spotify version that uses Web API and librespot (skip pyspotify)
RUN /opt/mopidy-venv/bin/pip install mopidy 'mopidy-spotify>=4.0.0'

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

# Use the virtual environment to run Mopidy
CMD ["/opt/mopidy-venv/bin/mopidy", "--config", "/etc/mopidy/mopidy.conf"]
