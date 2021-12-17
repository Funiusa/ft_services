#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

#start minikube in virtualbox
printf "\n${GREEN}[  START MINIKUBE IN VIRTUAL BOX  ]\n${NC}"
minikube start --vm-driver=virtualbox

#setup metallb in addons list
printf "\n${GREEN}[  ADDON AND CONFIG METALLB ]\n${NC}"
minikube addons enable metallb
#metallb apply config
kubectl apply -f srcs/metalLB/configmap.yaml

#build docker in minikube
printf "\n${GREEN}[  START DOCKER IN MINIKUBE ENVIRONMENT  ]\n${NC}"
eval "$(minikube -p minikube docker-env)"

# NGINX POD
printf "\n${GREEN}[  START NGINX POD  ]\n${NC}"
#setup deployment and service nginx
docker build -t nginx_image srcs/nginx
#nginx config apply
kubectl apply -f srcs/nginx/nginx.yaml

# PHPMYADMIN POD
printf "\n${GREEN}[  START PHPMYADMIN POD  ]\n${NC}"
#setup deployment and service phpmyadmin
docker build -t pma_image srcs/phpmyadmin
#phpmyadmin config apply
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# WORDPRESS POD
printf "\n${GREEN}[  START WORDPRESS POD  ]\n${NC}"
#setup deployment and service wordpress
docker build -t wp_image srcs/wordpress
# config apply
kubectl apply -f srcs/wordpress/wordpress.yaml

# MYSQL
printf "\n${GREEN}[  START MYSQL POD  ]\n${NC}"
#setup deployment and service mysql
docker build -t mysql_image srcs/mysql
# config apply
kubectl apply -f srcs/mysql/mysql.yaml

# FTPS
printf "\n${GREEN}[  START FTPS POD  ]\n${NC}"
#setup deployment and service ftps
docker build -t ftps_image srcs/ftps
# config apply
kubectl apply -f srcs/ftps/ftps.yaml

# TELEGRAF
printf "\n${GREEN}[  START TELEGRAF POD  ]\n${NC}"
#setup deployment and service telegraf
docker build -t telegraf_image srcs/telegraf
# config apply
kubectl apply -f srcs/telegraf/telegraf.yaml

# INFLUXDB
printf "\n${GREEN}[  SATART INFLUX POD  ]\n${NC}"
#setup deployment and service influx
docker build -t influxdb_image srcs/influx
# config apply
kubectl apply -f srcs/influx/influxdb.yaml

# GRAFANA
printf "\n${GREEN}[  START GRAFANA POD  ]\n${NC}"
#setup deployment and service grafana
docker build -t grafana_image srcs/grafana
# config apply
kubectl apply -f srcs/grafana/grafana.yaml

#open minikube dashboard
printf "\n${GREEN}[  OPEN MINIKUBE DASHBOARD  ]${NC} \n"
minikube dashboard
