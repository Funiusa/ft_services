FROM alpine:3.12
# https://alpine.pkgs.org/3.11/alpine-community-x86_64/influxdb-1.7.7-r1.apk.html

RUN apk update && apk upgrade \
	&& apk add influxdb bash \
	&& rm -rf /var/cache/apk/*

EXPOSE 8086

ENTRYPOINT influxd -config /etc/influxdb.conf
# https://docs.influxdata.com/influxdb/v1.7/introduction/installation/