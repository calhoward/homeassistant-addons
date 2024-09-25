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

# Install Mopidy and Spotify extension
RUN pip3 install mopidy mopidy-spotify

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

# Run Mopidy
CMD ["/opt/mopidy/bin/mopidy", "--config", "/etc/mopidy/mopidy.conf"]
