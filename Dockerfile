FROM alpine:3.8

LABEL maintainer="shaker242@gmail.com"

RUN apk add --no-cache nginx \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx
ADD jenkins /jenkins
COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /var/lib/nginx/html/index.html

COPY /img/*.png /var/lib/nginx/html/img/

EXPOSE 80
# For demo's, make the image ID unique
RUN date +%s | sha256sum | base64 | head -c 32 ; echo > /.junk

HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

CMD ["nginx"] 
