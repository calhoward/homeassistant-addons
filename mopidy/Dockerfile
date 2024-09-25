ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install core dependencies using apk
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-setuptools \
    curl \
    gstreamer \
    gst-plugins-base \
    gst-plugins-good

# Install Mopidy and core extensions using pip
RUN pip3 install mopidy mopidy-spotify mopidy-tidal mopidy-local

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

# Expose Mopidy port
EXPOSE 6680

CMD ["/run.sh"]
