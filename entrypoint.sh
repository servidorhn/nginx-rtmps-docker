#!/bin/bash

set -e

if [ -n "${STREAM_KEY}" ]; then
	echo "Stream activated"
	STREAM_KEY_esc=$(echo "$STREAM_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#stream|push '"$STREAM_URL""$STREAM_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No stream key set... disabling"
    sed -i 's|#stream| |g' /etc/nginx/nginx.conf 
fi

exec "$@"
