FROM debian:bullseye-slim

LABEL maintainer="Simple Restreaming"

# Update and Load initial packages
RUN apt-get update && \
	apt-get install -y nano nginx libnginx-mod-rtmp

# Import setting files and set new files
COPY nginx.conf /etc/nginx/nginx.conf

# Expose services to host
EXPOSE 1935

# Forward logs to Docker
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log
    
#Setup Streaming Services Details

#MixCloud
ENV STREAM_URL rtmp://us-east.faster.im/live/
ENV STREAM_KEY ""

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 1935

ENTRYPOINT ["/entrypoint.sh"]

# Initialise nginx
CMD ["nginx", "-g", "daemon off;"]
