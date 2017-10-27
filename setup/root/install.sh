#!/bin/bash

# Exit script if return code != 0
set -e

source /root/functions.sh

# Install any packages
echo "Installing nginx..."
pacman -S --noconfirm --noprogressbar --color=never nginx
mkdir -p /var/log/nginx
chmod 775 /var/log/nginx && chown http:http /var/log/nginx
ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log

echo "Downloading jsoneditor v${JSONEDITOR_VERSION} code"
mkdir -p /data
curl -L -sS -o /data/jsoneditor.min.js https://raw.githubusercontent.com/josdejong/jsoneditor/v${JSONEDITOR_VERSION}/dist/jsoneditor.min.js
curl -L -sS -o /data/jsoneditor.min.css https://raw.githubusercontent.com/josdejong/jsoneditor/v${JSONEDITOR_VERSION}/dist/jsoneditor.min.css
curl -L -sS --create-dirs -o /data/img/jsoneditor-icons.svg https://raw.githubusercontent.com/josdejong/jsoneditor/v${JSONEDITOR_VERSION}/dist/img/jsoneditor-icons.svg
chmod -R -w /data && chmod -R a+rX /data

# Cleanup
pacman_cleanup
