#!/bin/bash

set -e


if [ -n "${FACEBOOK_KEY}" ]; then
	echo "Facebook activated"
	FACEBOOK_KEY_esc=$(echo "$FACEBOOK_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#facebook|push '"$FACEBOOK_URL""$FACEBOOK_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Facebook stream key set... disabling"
    sed -i 's|#facebook| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${TWITTER_KEY}" ]; then
	echo "Twitter activated"
	TWITTER_KEY_esc=$(echo "$TWITTER_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#twitter|push '"$TWITTER_URL""$TWITTER_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No Twitter stream key set... disabling"
    sed -i 's|#twitter| |g' /etc/nginx/nginx.conf 
fi

if [ -n "${YOUTUBE_KEY}" ]; then
	echo "YouTube activated"
	YOUTUBE_KEY_esc=$(echo "$YOUTUBE_KEY" | sed 's/[\*\.&]/\\&/g')
	sed -i 's|#youtube|push '"$YOUTUBE_URL""$YOUTUBE_KEY_esc"';|g' /etc/nginx/nginx.conf 
else 
    echo "No YouTube stream key set... disabling"
    sed -i 's|#youtube| |g' /etc/nginx/nginx.conf 
fi

stunnel4

exec "$@"
