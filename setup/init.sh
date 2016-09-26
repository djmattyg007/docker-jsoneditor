#!/bin/bash

if [[ -z "${TIMESCHED_HTTP_SERVERNAME}${TIMESCHED_HTTPS_SERVERNAME}" ]]; then
    echo "[error] No server names specified, cannot run nginx"
    exit 1
fi

mkdir -p /etc/nginx/sites-enabled
if [[ -n "${TIMESCHED_HTTP_SERVERNAME}" ]]; then
    echo "[info] Found HTTP servername, adding HTTP configuration to nginx"
    sed -e "s/___SERVER_NAME___/${TIMESCHED_HTTP_SERVERNAME}/" /etc/timesched/nginx/http.ngx > /etc/nginx/sites-enabled/http.ngx
else
    rm -f /etc/nginx/sites-enabled/http.ngx
fi
if [[ -n "${TIMESCHED_HTTPS_SERVERNAME}" ]]; then
    echo "[info] Found HTTPS servername, adding HTTPS configuration to nginx"
    sed -e "s/___SERVER_NAME___/${TIMESCHED_HTTPS_SERVERNAME}/" /etc/timesched/nginx/https.ngx > /etc/nginx/sites-enabled/https.ngx
else
    rm -f /etc/nginx/sites-enabled/https.ngx
fi

# Finally, run nginx.
echo "[info] Starting nginx"
exec /usr/bin/nginx -c /etc/nginx/nginx.custom.conf 
