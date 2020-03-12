FROM nginx:alpine
  
LABEL MAINTAINER="shaker242@gmail.com"
LABEL HEALTHCHECK="NULL"

RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/lib/nginx/html/index.html
COPY /img/* /var/lib/nginx/html/img/

USER nginx
EXPOSE 8080

ENTRYPOINT ["nginx"]
