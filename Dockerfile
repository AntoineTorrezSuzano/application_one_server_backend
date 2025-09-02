FROM docker.io/library/nginx

COPY ./html/ /usr/share/nginx/html

EXPOSE 80
