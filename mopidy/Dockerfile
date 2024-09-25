ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install dependencies using Alpine's apk with correct package names
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-setuptools \
    gstreamer \
    gstreamer-plugins-base \
    gstreamer-plugins-good \
    gstreamer-plugins-bad \
    gstreamer-plugins-ugly \
    gstreamer-pulseaudio \
    gstreamer-libav \
    gstreamer-tools \
    curl

# Install Mopidy and core extensions using pip
RUN pip3 install mopidy mopidy-spotify mopidy-tidal mopidy-local

# Create Mopidy configuration directory
RUN mkdir -p /etc/mopidy

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

CMD ["/run.sh"]
