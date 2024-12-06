FROM nginx:alpine

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

ADD ./personal /site

WORKDIR /site
RUN hugo build  && cp -Rv /site/public/* /usr/share/nginx/html/

RUN ls

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]