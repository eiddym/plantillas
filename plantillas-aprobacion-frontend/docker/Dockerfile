# --- ETAPA 1: Compilación del Frontend ---
FROM node:6.17.1-alpine AS builder

WORKDIR /app

# Instalar dependencias del sistema necesarias para Bower y Git
RUN apk add --no-cache git python make g++

# npm 3 / Node 6 sobre Alpine puede fallar resolviendo uid/gid.
# unsafe-perm evita que npm intente usar el usuario nobody durante scripts.
ENV npm_config_unsafe_perm=true

# Instalar Bower compatible con Node 6 y verificar la herramienta.
RUN npm config set unsafe-perm true && \
    npm install -g --unsafe-perm bower@1.8.8 && \
    ln -sf /usr/local/lib/node_modules/bower/bin/bower /usr/local/bin/bower && \
    node --version && \
    npm --version && \
    bower --version

# Copiar archivos de dependencias
COPY package.json package-lock.json bower.json .bowerrc ./

# Instalar dependencias locales
RUN npm config set fetch-retries 5 && \
    npm config set fetch-retry-mintimeout 20000 && \
    npm config set fetch-retry-maxtimeout 120000 && \
    npm install --unsafe-perm --no-audit --no-fund && \
    /usr/local/bin/bower install --allow-root

# Copiar el resto del código fuente del frontend
COPY . .

# Preparar constantes y ejecutar compilación + sed
RUN ./node_modules/.bin/gulp build && \
    sed -i -e 's/src=maps\//src=/g' dist/index.html && \
    sed -i -e 's/.js.map/.js/g' dist/index.html && \
    sed -i -E "s#(src=)([^ >]+\.js)([ >])#\1\2?v=$(date +%s)\3#g" dist/index.html

# --- ETAPA 2: Servidor de Producción (Nginx) ---
FROM nginx:1.15.12-alpine

COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/default.conf /etc/nginx/conf.d/default.conf
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY --from=builder /app/dist /usr/share/nginx/html

RUN chown -R nobody:nobody /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]