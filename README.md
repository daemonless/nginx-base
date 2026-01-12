# Nginx Base

Shared base image for Nginx-based applications.

| | |
|---|---|
| **Registry** | `ghcr.io/daemonless/nginx-base` |
| **Source** | [https://github.com/daemonless/nginx-base](https://github.com/daemonless/nginx-base) |
| **Website** | [https://nginx.org/](https://nginx.org/) |

## Deployment

### Podman Compose

```yaml
services:
  nginx-base:
    image: ghcr.io/daemonless/nginx-base:latest
    container_name: nginx-base
    environment:
    volumes:
    ports:
    restart: unless-stopped
```

### Podman CLI

```bash
podman run -d --name nginx-base \
  ghcr.io/daemonless/nginx-base:latest
```

### Ansible

```yaml
- name: Deploy nginx-base
  containers.podman.podman_container:
    name: nginx-base
    image: ghcr.io/daemonless/nginx-base:latest
    state: started
    restart_policy: always
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|

### Volumes

| Path | Description |
|------|-------------|

### Ports

| Port | Protocol | Description |
|------|----------|-------------|

## Notes

- **User:** `root` (UID/GID set via PUID/PGID)
- **Base:** Built on `ghcr.io/daemonless/base` (FreeBSD)