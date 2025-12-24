# nginx-base-image

An extended base image pre-configured with **nginx** and s6 supervision for serving web applications on FreeBSD.

## Overview

This image extends `base-image` by adding a pre-configured nginx installation. It is designed to be a "ready-to-go" platform for PHP, PHP-FPM, or static web applications.

## Features

- **Inherits all `base-image` features** (s6, PUID/PGID, VNET).
- **Pre-configured nginx**: Service is defined and ready to serve files from `/usr/local/www/html`.
- **Automatic Permissions**: Logs and web directories are correctly permissioned at startup.

## Usage (for Image Developers)

Use this if your application requires a web server:

```dockerfile
FROM ghcr.io/daemonless/nginx-base-image:15

# Add your web files
COPY my-site/ /usr/local/www/html/

# Optional: Add custom nginx config
COPY my-nginx.conf /usr/local/etc/nginx/nginx.conf
```

## Exposed Ports

- `80`: Standard HTTP.
- `443`: HTTPS.

## Directory Structure

- `/usr/local/www/html`: Default web root.
- `/var/log/nginx`: nginx log directory.
- `/usr/local/etc/nginx`: nginx configuration files.
<!-- Trigger build -->
