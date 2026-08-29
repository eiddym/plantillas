#!/bin/sh
set -e

IP_HOST=$(ip route get 8.8.8.8 2>/dev/null | awk '{for(i=1;i<=NF;i++) if ($i=="src") print $(i+1)}')

if [ -z "$IP_HOST" ]; then
  IP_HOST=$(hostname -I | awk '{print $1}')
fi

if [ -z "$IP_HOST" ]; then
  echo "[detectar-ip-host] No se pudo detectar la IP del host." >&2
  exit 1
fi

echo "URL_VERIFICACION=http://${IP_HOST}/verificar" > /shared/url_verificacion.env
echo "[detectar-ip-host] IP detectada: ${IP_HOST}"
