FROM alpine

RUN apk add --no-cache nginx curl \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx /var/cache/nginx/client_temp

RUN chown nginx /var/log/nginx /run/nginx/ 

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/lib/nginx/html/index.html

COPY /img/*.png /var/lib/nginx/html/img/

RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx
	
EXPOSE 8080

USER nginx

CMD ["nginx"] 
