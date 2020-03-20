FROM alpine:3.8
RUN apk add --no-cache nginx curl shadow\
	&& mkdir -p /var/lib/nginx/html/img /run/nginx /var/cache/nginx /var/lib/nginx/data
RUN usermod -u 10001 nginx \
    && groupmod -g 10001 nginx
RUN chown -R 10001:10001 /var/cache/nginx /var/run /var/log/nginx /var/cache/nginx /var/lib/nginx /run/nginx/ /etc/nginx/ /var/lib/nginx/data
RUN touch /var/log/error.log /var/log/access.log
RUN chmod +x /var/cache/nginx /var/run /var/log/nginx /var/cache/nginx /var/lib/nginx /var/lib/nginx/data /var/log/error.log /var/log/access.log

COPY nginx.conf /etc/nginx/config.d/default.conf
COPY index.html /var/lib/nginx/html/index.html
COPY /img/*.png /var/lib/nginx/html/img/
EXPOSE 8080
#USER 10001
CMD /usr/sbin/nginx
