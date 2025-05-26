FROM nginx:1.27

# Prepare and update repositories
RUN apt-get purge -y nginx* \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && apt-get install -y apt-transport-https \
    && apt-get update -y

# Install dependencies
RUN apt-get install -y --no-install-recommends nginx-extras

# Remove default config (not needed)
RUN unlink /etc/nginx/sites-enabled/default \
   && rm -f /etc/nginx/conf.d/default.conf

# Copy Nginx config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# Free Cache
RUN rm -rf /var/lib/apt/lists/* \
    && apt-get clean

HEALTHCHECK --interval=3s --timeout=10s CMD service nginx status
