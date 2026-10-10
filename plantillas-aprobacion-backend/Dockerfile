FROM node:12.22.7-stretch-slim

# Debian Stretch está archivado; usar repositorios históricos.
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's/security.debian.org\/debian-security/archive.debian.org\/debian-security/g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list

# Dependencias necesarias para generación de PDF, Java y utilidades legacy.
RUN apt-get update && \
    mkdir -p /usr/share/man/man1 && \
    apt-get install --no-install-recommends -y \
      bzip2 \
      ca-certificates \
      chromium \
      curl \
      openjdk-8-jre-headless \
      python && \
    curl -fsL https://github.com/krallin/tini/releases/download/v0.19.0/tini \
      -o /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini && \
    npm install -g sequelize-cli pg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar manifiestos primero para aprovechar cache en builds posteriores.
COPY package.json package-lock.json ./

# Instalar dependencias de aplicación dentro de la imagen.
RUN npm install --no-audit --no-fund

# Copiar el resto del backend: index.js, src, parches, public y recursos.
COPY . .

# Registrar tipografías institucionales (Teko) en la caché del sistema fontconfig.
RUN mkdir -p /usr/share/fonts/truetype/teko && \
    cp /app/src/lib/html_plantilla/assets/fonts/*.ttf /usr/share/fonts/truetype/teko/ 2>/dev/null || true && \
    fc-cache -f /usr/share/fonts/truetype/teko/

RUN if [ ! -f /app/src/config/config.js ] && \
       [ -f /app/src/config/config.js.sample ]; then \
      cp /app/src/config/config.js.sample /app/src/config/config.js; \
    fi && \
    if [ ! -f /app/src/config/config.json ] && \
       [ -f /app/src/config/config.json.sample ]; then \
      cp /app/src/config/config.json.sample /app/src/config/config.json; \
    fi && \
    chown -R node:node /app

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/tini", "--"]

CMD ["node", "index.js"]
