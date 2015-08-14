FROM debian:wheezy
MAINTAINER Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

ADD rootfs /

# Configure apt
RUN \
    # Prepare system
    apt-wrap apt-get update \
    && apt-wrap apt-get install -y --no-install-recommends apt-utils \

    # Fix locales
    && apt-wrap apt-get install -y --no-install-recommends locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-wrap apt-get dist-upgrade -y --no-install-recommends \

    # Clean up
    && apt-wrap apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG en_US.utf8

# Add s6 overlay (https://github.com/just-containers/s6-overlay)
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.14.0.0/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz
RUN tar xvfz /tmp/s6-overlay.tar.gz -C /
ENTRYPOINT ["/init"]
