FROM alpine:3.7

LABEL maintainer="shaker242@gmail.com"

RUN apk update && apk upgrade && apk add nginx \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx

RUN chown nginx /var/log/nginx && chown nginx /run/nginx

USER nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/lib/nginx/html/index.html

COPY kubelogo.png /var/lib/nginx/html/img/

EXPOSE 8080

CMD ["nginx"] 
