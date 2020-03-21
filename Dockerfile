FROM alpine
RUN apk add --no-cache nginx curl shadow\
	&& mkdir -p /var/lib/nginx/html/img /run/nginx /var/cache/nginx /var/lib/nginx/data
RUN usermod -u 10001 nginx \
    && groupmod -g 10001 nginx
RUN chown -R 10001:10001 /var/cache/nginx /var/run /var/log/nginx /var/cache/nginx /var/lib/nginx /run/nginx/ /etc/nginx/ /var/lib/nginx/data
RUN chmod +x /var/cache/nginx /var/run /var/log/nginx /var/cache/nginx /var/lib/nginx /var/lib/nginx/data
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/lib/nginx/html/index.html
COPY /img/*.png /var/lib/nginx/html/img/
EXPOSE 8080
USER nginx
ENTRYPOINT /usr/sbin/nginx
