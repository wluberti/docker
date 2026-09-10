# Docker playground

Personal collection of Docker Compose stacks for local development and
experimentation.

Images are built and pushed to [Docker Hub — zenith](https://hub.docker.com/u/zenith).

## Stacks

| Directory | Description |
|---|---|
| `python/` | Python 3.14 + Django + PostgreSQL (`zenith/python`) |
| `php8composer/` | PHP 8 FPM + Composer + Nginx (`zenith/php8composer`) |
| `php8laravel/` | PHP 8.5 FPM + Laravel toolchain + Nginx (`zenith/php8laravel`) |
| `nginxphp/` | PHP FPM + Nginx (stock images) |
| `php8wordpress/` | WordPress + MariaDB |
| `mysql/` | MySQL 8.4 + Adminer |
| `mariaDb/` | MariaDB + Adminer |
| `homeAssistant/` | Home Assistant (host networking) |

## Usage

Each directory is self-contained:

```bash
cd <stack>
docker compose up -d
```