FROM dtr.docker.ee/linux/alpine:3.8-signed
LABEL MAINTAINER="shaker@docker.com"
LABEL OS_VER="EE-OFFICIAL_ALPINE_3.8"
LABEL HEALTHCHECK="NULL"
LABEL STACK="webapp"
LABEL APK="nginx curl"

RUN apk add --no-cache nginx curl \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/lib/nginx/html/index.html

COPY /img/*.png /var/lib/nginx/html/img/

EXPOSE 80

# HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

CMD ["nginx"] 
