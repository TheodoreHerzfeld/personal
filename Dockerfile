FROM nginx:alpine

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

ADD ./personal /site

WORKDIR /site
RUN rm -rfv /usr/share/nginx/html/*
RUN hugo build && cp -Rv /site/public/* /usr/share/nginx/html/
RUN chown -Rv nginx:nginx /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
