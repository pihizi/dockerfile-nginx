FROM debian:7.6
MAINTAINER pihizi@msn.com

# Install Nginx
RUN \
    DEBIAN_FRONTEND=noninteractive \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y nginx && \
    # Remove apt cache
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    # HTTP Request cache
    chown -R www-data:www-data /var/lib/nginx

# Define mountable directories
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

# Define working directory
WORKDIR /etc/nginx

# Define default command
CMD ["nginx"]

# Expose ports
EXPOSE 80
EXPOSE 443
