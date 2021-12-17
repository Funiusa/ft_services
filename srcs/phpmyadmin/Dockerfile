FROM  alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx bash wget

RUN adduser -D -g 'tevelyne' tevelyne \
	&& mkdir -p /www/phpmyadmin \
	&& chown -R tevelyne:tevelyne /var/lib/nginx \
	&& chown -R tevelyne:tevelyne /www

# Configure nginx
RUN mkdir -p var/run/nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY ./nginx.conf /etc/nginx/

# PHP
RUN apk add php7 php7-fpm php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

# phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz\
	&& tar -C /www/phpmyadmin -xvzf phpMyAdmin-5.0.4-english.tar.gz --strip-components 1 \
	&& rm -rf phpMyAdmin-5.0.4-english.tar.gz

COPY config.inc.php /www/phpmyadmin
COPY run_nginx_php.sh /tmp/run_nginx_php.sh
RUN chmod 644 /tmp/run_nginx_php.sh

EXPOSE 5000
ENTRYPOINT ["bash", "/tmp/run_nginx_php.sh"]
