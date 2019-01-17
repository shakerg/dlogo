FROM dtr.docker.ee/official/alpine:3.8

LABEL maintainer="shaker242@gmail.com"

RUN apk add --no-cache nginx curl \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/lib/nginx/html/index.html

COPY /img/*.png /var/lib/nginx/html/img/

EXPOSE 80

HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1

CMD ["nginx"] 
