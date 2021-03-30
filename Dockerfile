FROM nginx:1.19.8-alpine

EXPOSE 80

COPY . /usr/share/nginx/html