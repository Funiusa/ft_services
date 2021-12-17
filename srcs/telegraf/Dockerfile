FROM alpine:3.12
#https://devconnected.com/how-to-install-influxdb-telegraf-and-grafana-on-docker/#Installing_Telegraf_on_Docker

RUN apk update && apk upgrade \
    && apk --no-cache add wget \
    && wget http://dl-cdn.alpinelinux.org/alpine/edge/community/x86_64/telegraf-1.18.2-r0.apk \
    && apk --no-cache add telegraf-1.18.2-r0.apk \
    && mkdir -p /etc/telegraf \
    && rm -rf telegraf-1.18.2-r0.apk
COPY telegraf.conf /etc/telegraf

ENTRYPOINT telegraf --config /etc/telegraf/telegraf.conf

#https://octoperf.com/blog/2019/09/19/kraken-kubernetes-influxdb-grafana-telegraf/#map-a-configuration-file-using-configmap
#https://docs.influxdata.com/platform/monitoring/containers/kubernetes/
