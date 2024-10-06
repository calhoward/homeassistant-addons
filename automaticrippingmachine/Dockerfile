# Use Ubuntu as the base image for better compatibility with apt-get
FROM ubuntu:20.04

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Add the MakeMKV PPA and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:heyarje/makemkv-beta \
    && apt-get update && apt-get install -y \
    ffmpeg \
    makemkv-bin \
    makemkv-oss \
    handbrake-cli \
    python3 \
    python3-pip \
    git \
    sqlite3 \
    curl \
    build-essential \
    pkg-config \
    libavcodec-dev \
    libavutil-dev \
    libssl-dev \
    libexpat1-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages required by ARM
RUN pip3 install \
    werkzeug==1.0.1 \
    flask==1.1.2 \
    jinja2==2.11.3 \
    itsdangerous==1.1.0 \
    markupsafe==1.1.1 \
    flask_sqlalchemy==2.4.4 \
    sqlalchemy==1.3.23

# Clone ARM repository and set up
RUN git clone https://github.com/automatic-ripping-machine/automatic-ripping-machine.git /opt/arm

# Make necessary directories for ARM
RUN mkdir -p /etc/arm/config && chown -R 1000:1000 /etc/arm

# Remove udev and syslog-ng to prevent issues
RUN rm -f /etc/my_init.d/start_udev.sh
RUN rm -f /etc/my_init.d/10_syslog-ng.init

# S6 Overlay stage 2 hook for lifecycle management
ENV S6_STAGE2_HOOK=/etc/s6-overlay/scripts/stage2_hook.sh

# Expose ARM service on port 8080 (handled by ingress)
EXPOSE 8080

# Start ARM using the default init system
CMD ["/sbin/my_init"]
