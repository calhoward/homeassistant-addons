ARG BUILD_FROM
FROM $BUILD_FROM

# Install wget and VirtualHere
RUN apk add --no-cache wget && \
    wget https://www.virtualhere.com/sites/default/files/usbserver/vhusbdx86_64 -O /usr/bin/vhusbd && \
    chmod +x /usr/bin/vhusbd

# Start VirtualHere USB Server when the add-on is started
CMD [ "/usr/bin/vhusbd" ]
