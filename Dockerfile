#based image from nginx alpine
From nginx:alpine
# copy new configuration files
COPY ./default.conf /etc/nginx/conf.d/
# copy web server file
COPY ./index.html /usr/share/nginx/html
# run nginx
CMD ["nginx", "-g", "daemon off;"]
