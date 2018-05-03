FROM alpine:3.7 

LABEL maintainer="shaker242@gmail.com"

RUN apk add --no-cache nginx && mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/nginx.conf

#VOLUME ["/marriott"]

#COPY index.html /var/lib/nginx/html/index.html
#COPY /img/*.png /var/lib/nginx/html/img/

EXPOSE 80

CMD ["nginx"] 
