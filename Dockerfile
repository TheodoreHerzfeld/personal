# STAGE BUILD - build website static files
FROM alpine as build

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

ADD ./site /site

RUN rm -rfv /site/public

WORKDIR /site
RUN hugo build

# STAGE 2 - create nginx container with embedded site files
FROM nginx:alpine

RUN rm -rfv /usr/share/nginx/html/*
COPY --from=build /site/public/ /usr/share/nginx/html/
RUN chown -Rv nginx:nginx /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
