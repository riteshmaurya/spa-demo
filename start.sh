#!/bin/sh

# replace static values with environment variables
if [ -n "$STAGE" ]; then
    sed -i "s#_ENV_SETTINGS_#$STAGE#g" /usr/share/nginx /html/main.*.bundle.js
fi
echo "all is well"
# start webserver
exec nginx -g 'daemon off;'
