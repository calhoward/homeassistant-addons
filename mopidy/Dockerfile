ARG BUILD_FROM=ghcr.io/hassio-addons/base/ubuntu:latest
FROM $BUILD_FROM

# Setup environment
ENV LANG C.UTF-8

# Install dependencies and Mopidy
RUN apt-get update && apt-get install -y \
    mopidy \
    mopidy-spotify \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    python3-pip \
    && pip3 install Mopidy-Iris \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port (not needed for ingress but kept for manual testing)
EXPOSE 6680

# Start Mopidy on container start
CMD [ "/run.sh" ]
