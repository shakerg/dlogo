FROM dtr.docker.ee/linux/alpine:3.8-signed

RUN apk add --no-cache nginx curl \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx

RUN chown nginx /var/log/nginx /run/nginx/ 

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/lib/nginx/html/index.html

COPY /img/*.png /var/lib/nginx/html/img/

EXPOSE 8080

USER nginx

CMD ["nginx"] 
