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
    libcurl \
    glib \
    glib-dev \
    gstreamer \
    gst-plugins-base \
    gst-plugins-good \
    gst-libav \
    libcurl-dev

# Skip upgrading pip, use the system-provided version
# Install Mopidy and its extensions using pip3 with verbose logging
RUN pip3 install --verbose mopidy mopidy-spotify mopidy-tidal mopidy-local

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

CMD ["/run.sh"]
