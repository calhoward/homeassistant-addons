ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install dependencies for Mopidy and GStreamer
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

# Activate the virtual environment and install Mopidy
RUN /opt/mopidy-venv/bin/pip install mopidy

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port (default: 6680 for HTTP frontend)
EXPOSE 6680

# Run Mopidy using the virtual environment
CMD ["/run.sh"]
