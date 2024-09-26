# Define the base image
ARG BUILD_FROM
FROM $BUILD_FROM

# Set environment variables
ENV LANG C.UTF-8

# Install necessary packages for GStreamer, GObject Introspection, and Mopidy dependencies
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
    gobject-introspection \
    gstreamer \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-bad \
    gst-plugins-ugly \
    pulseaudio \
    gst-libav \
    bash \
    gobject-introspection-dev \
    cairo-dev \
    py-cairo

# Install PyGObject (Python bindings for GObject)
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    pygobject3 \
    py3-gobject3

# Create a virtual environment for Mopidy and activate it
RUN python3 -m venv /opt/mopidy-venv

# Activate the virtual environment and install Mopidy
RUN . /opt/mopidy-venv/bin/activate && \
    pip install --upgrade pip && \
    pip install mopidy

# Ensure the virtual environment is always activated when running Mopidy
ENV PATH="/opt/mopidy-venv/bin:$PATH"

# Create service directory for s6-overlay to manage Mopidy as a service
RUN mkdir -p /etc/services.d/mopidy

# Copy the run script into the service directory
COPY run.sh /etc/services.d/mopidy/run
RUN chmod +x /etc/services.d/mopidy/run

# Expose the Mopidy web frontend port (default 6680)
EXPOSE 6680

# Use s6-overlay to manage services
ENTRYPOINT [ "/init" ]
