FROM alpine

LABEL MAINTAINER="shaker242@gmail.com"
LABEL HEALTHCHECK="NULL"

RUN apk add --no-cache nginx curl \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/lib/nginx/html/index.html
COPY /img/* /var/lib/nginx/html/img/

EXPOSE 80

CMD ["nginx"] 
