FROM alpine:3.12
#https://www.howtoforge.com/tutorial/how-to-install-and-configure-vsftpd/
#https://wiki.archlinux.org/title/Very_Secure_FTP_Daemon
#http://vsftpd.beasts.org/vsftpd_conf.html
#https://serverfault.com/questions/544850/create-new-vsftpd-user-and-lock-to-specify-home-login-directory

RUN apk update && apk upgrade \
	&& apk add --no-cache vsftpd bash wget openssl

RUN mkdir -p /ftps/tevelyne \
	&& adduser -h /ftps/tevelyne -D tevelyne \
	&& echo 'tevelyne:tevelyne' | chpasswd \
	&& chmod -R 777 /ftps \
	&& chown -R tevelyne:tevelyne /ftps

# SSL
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/certs/vsftpd.pem -keyout /etc/ssl/certs/vsftpd.pem \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=21-school/OU=tevelyne/CN=tevelyne"

COPY ./vsftpd.conf /etc/vsftpd/
COPY ./start_vsftpd.sh /tmp/
RUN chmod -R 644 /tmp

EXPOSE 20-21 21040-21044
ENTRYPOINT ["bash", "/tmp/start_vsftpd.sh"]

#A PersistentVolumeClaim (PVC) is a request for storage by a user. 
#It is similar to a Pod. Pods consume node resources and PVCs 
#consume PV resources. 
#Pods can request specific levels of resources (CPU and Memory). 
#Claims can request specific size and access modes
#(e.g., they can be mounted ReadWriteOnce, 
#ReadOnlyMany or ReadWriteMany, see AccessModes).

# The next step is to create a PersistentVolumeClaim. 
# Pods use PersistentVolumeClaims to request physical storage. 
# In this PersistentVolumeClaim that requests a volume of at least 
# three gibibytes that can provide read-write access for at least one Node.

#https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/