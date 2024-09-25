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
    gst-libav \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-tools

# Install Mopidy and Spotify extension
RUN python3 -m pip install mopidy mopidy-spotify

# Install GStreamer spotify plugin for audio playback
RUN git clone https://github.com/mopidy/mopidy-spotify && cd mopidy-spotify && \
    make && make install

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

# Run Mopidy
CMD ["/opt/mopidy/bin/mopidy", "--config", "/etc/mopidy/mopidy.conf"]
