FROM node:12.22.7-stretch-slim

# TRUCO CLAVE: Cambiar los repositorios muertos de Stretch al archivo histórico externo
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org\/debian-security/archive.debian.org\/debian-security/g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list

# Ahora tu comando original correrá sin problemas:
RUN apt-get update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get install --no-install-recommends -y bzip2 ca-certificates curl openjdk-8-jre-headless python && \
    curl -fsL https://github.com/krallin/tini/releases/download/v0.19.0/tini -o /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini && \
    npm install -g sequelize-cli pg && \
    mkdir /app && \
    chown -R node:node /app
