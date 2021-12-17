FROM alpine:3.12
#https://wiki.alpinelinux.org/wiki/Nginx
RUN apk update && apk upgrade
RUN apk add --no-cache nginx bash openssl

# Creating new user and group 'www' for nginx
# Create a directory for html files
RUN adduser -D -g 'www' www \
	&& mkdir /www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /www

RUN mkdir -p var/run/nginx

# Config NGINX
# Backup of original nginx.conf file before writting my own
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/

# SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/tevelyne.pem -keyout /etc/ssl/certs/tevelyne.key \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=tevelyne/CN=tevelyne"


COPY index.html /www/
#RUN mkdir -p /run/nginx && nginx -g 'pid /tmp/nginx.pid;'

EXPOSE 80 443
#start nginx, nginx in demon mod
ENTRYPOINT ["nginx", "-g", "daemon off;"]
