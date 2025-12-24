ARG BASE_VERSION=15
FROM ghcr.io/daemonless/base:${BASE_VERSION}

ARG FREEBSD_ARCH=amd64
LABEL org.opencontainers.image.title="nginx-base" \
      org.opencontainers.image.description="FreeBSD nginx base image with s6 supervision" \
      org.opencontainers.image.source="https://github.com/daemonless/nginx-base" \
      org.opencontainers.image.url="https://nginx.org/" \
      org.opencontainers.image.documentation="https://nginx.org/en/docs/" \
      org.opencontainers.image.licenses="BSD-2-Clause" \
      org.opencontainers.image.vendor="daemonless" \
      org.opencontainers.image.authors="daemonless"

# Install nginx
# Note: umask 022 ensures directories are created with correct permissions
RUN umask 022 && pkg update && \
    pkg install -y nginx && \
    pkg clean -ay && \
    rm -rf /var/cache/pkg/* /var/db/pkg/repos/*

# Create directories (ownership set at runtime by cont-init)
RUN mkdir -p /var/log/nginx /usr/local/www/html

# Copy nginx service and default config
COPY root/ /

# Make scripts executable
RUN chmod +x /etc/services.d/nginx/run /etc/cont-init.d/* 2>/dev/null || true

# Set up s6 service link

EXPOSE 80 443

