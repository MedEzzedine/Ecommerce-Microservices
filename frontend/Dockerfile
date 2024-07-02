FROM nginx:stable-alpine

COPY build/ /usr/share/nginx/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]