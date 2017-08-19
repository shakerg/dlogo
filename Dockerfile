FROM alpine:latest
RUN apk update && apk add nginx \
	&& mkdir -p /var/lib/nginx/html/img /run/nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/lib/nginx/html/index.html
COPY /img/*.png /var/lib/nginx/html/img/
EXPOSE 80
#CMD ["nginx"] 

#, "-g", "daemon off;"]


	#&& adduser -D -u 1000 -g 'www' -h /www www \

	#mkdir /www && \
	#chown -R www:www /var/lib/nginx && \
	#chown -R www:www /www 

	#mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
	


#FROM nginx:latest
#
#COPY index.html /usr/share/nginx/html
#RUN mkdir -p /usr/share/nginx/html/img
#COPY /img/*.png /usr/share/nginx/html/img/
#
#EXPOSE 80 443
#
#CMD ["nginx", "-g", "daemon off;"]
