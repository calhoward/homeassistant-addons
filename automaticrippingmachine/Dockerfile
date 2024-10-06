# Use Ubuntu as the base image for better compatibility with apt-get
FROM ubuntu:20.04

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies using apt-get (previously working setup)
RUN apt-get update && apt-get install -y \
    software-properties-common \
    ffmpeg \
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

# Add MakeMKV repository and install MakeMKV
RUN add-apt-repository ppa:heyarje/makemkv-beta \
    && apt-get update && apt-get install -y \
    makemkv-bin \
    makemkv-oss

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

# Install S6 Overlay for init system
RUN curl -L -o /tmp/s6-overlay.tar.gz https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.2/s6-overlay-amd64.tar.gz \
    && tar -xzf /tmp/s6-overlay.tar.gz -C / \
    && rm /tmp/s6-overlay.tar.gz

# S6 Overlay stage 2 hook for lifecycle management
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENV S6_STAGE2_HOOK=/etc/s6-overlay/scripts/stage2_hook.sh

# Expose ARM service on port 8080 (handled by ingress)
EXPOSE 8080

# Start S6 Overlay
ENTRYPOINT ["/init"]
