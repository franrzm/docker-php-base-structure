FROM nginx:1

RUN apt-get update \
    && apt-get install nginx-extras -y

RUN unlink /etc/nginx/sites-enabled/default \
    && rm /etc/nginx/conf.d/default.conf
