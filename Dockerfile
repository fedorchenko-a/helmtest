FROM openresty/openresty:1.21.4.2-1-bullseye


COPY ./conf.d /etc/nginx/conf.d
