ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install core dependencies using Alpine apk
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
    gst-libav

# Download and install libspotify from a valid source
RUN curl -L -o libspotify.tar.gz https://github.com/mopidy/libspotify-deb/releases/download/v12.1.51/libspotify_12.1.51.orig-amd64.tar.gz && \
    tar xzf libspotify.tar.gz && \
    mv libspotify-12.1.51 /usr/local/libspotify && \
    ln -s /usr/local/libspotify/lib/libspotify.so /usr/lib/libspotify.so && \
    ln -s /usr/local/libspotify/include/libspotify /usr/include/libspotify && \
    rm libspotify.tar.gz

# Create a virtual environment for Mopidy
RUN python3 -m venv /opt/mopidy

# Activate the virtual environment and install Mopidy and its extensions
RUN /opt/mopidy/bin/pip install --no-cache-dir mopidy mopidy-spotify mopidy-tidal mopidy-local

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

# Use the virtual environment to run Mopidy
CMD ["/opt/mopidy/bin/mopidy", "--config", "/etc/mopidy/mopidy.conf"]
