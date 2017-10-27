#!/bin/bash

if [[ -z "${JSONEDITOR_HTTP_SERVERNAME}${JSONEDITOR_HTTPS_SERVERNAME}" ]]; then
    echo "[error] No server names specified, cannot run nginx"
    exit 1
fi

mkdir -p /etc/nginx/sites-enabled
if [[ -n "${JSONEDITOR_HTTP_SERVERNAME}" ]]; then
    echo "[info] Found HTTP servername, adding HTTP configuration to nginx"
    sed -e "s/___SERVER_NAME___/${JSONEDITOR_HTTP_SERVERNAME}/" /etc/jsoneditor/nginx/http.ngx > /etc/nginx/sites-enabled/http.ngx
else
    rm -f /etc/nginx/sites-enabled/http.ngx
fi
if [[ -n "${JSONEDITOR_HTTPS_SERVERNAME}" ]]; then
    echo "[info] Found HTTPS servername, adding HTTPS configuration to nginx"
    sed -e "s/___SERVER_NAME___/${JSONEDITOR_HTTPS_SERVERNAME}/" /etc/jsoneditor/nginx/https.ngx > /etc/nginx/sites-enabled/https.ngx
else
    rm -f /etc/nginx/sites-enabled/https.ngx
fi

# Finally, run nginx.
echo "[info] Starting nginx"
# Don't use chpst - nginx needs to start as root to bind ports.
# It can be trusted to drop privileges properly after binding ports.
exec /usr/bin/nginx -c /etc/nginx/nginx.custom.conf 
