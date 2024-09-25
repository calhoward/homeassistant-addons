ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install core dependencies using Alpine apk
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-setuptools \
    curl \
    gstreamer \
    gst-plugins-base \
    gst-plugins-good \
    build-base \
    gcc \
    g++ \
    libc-dev \
    pkgconfig \
    python3-dev \
    libffi-dev \
    libcurl \
    openssl-dev

# Reinstall pip directly using the apk package manager to avoid issues
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community py3-pip

# Make sure pip is available and upgrade if necessary
RUN python3 -m ensurepip --upgrade && \
    pip3 install --no-cache --upgrade pip

# Install Mopidy and its extensions using pip
RUN pip3 install mopidy mopidy-spotify mopidy-tidal mopidy-local

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

CMD ["/run.sh"]
