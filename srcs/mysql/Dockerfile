FROM    alpine:3.12
#https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

RUN apk update && apk upgrade \
	&& apk add mysql mysql-client bash \
	&& rm -rf /var/cache/apk/*

COPY mysql.sh /tmp/
COPY tevelyne_db.sql my.cnf ./


RUN mkdir -p /run/mysqld \
	&& mv my.cnf /etc/ \
    && chmod 644 /tmp

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["bash", "/tmp/mysql.sh"]