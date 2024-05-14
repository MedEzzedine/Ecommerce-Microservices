FROM nginx:stable-alpine

ARG WORKING_DIRECTORY=/app

COPY ${WORKING_DIRECTORY}/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]