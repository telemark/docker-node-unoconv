# Setting the base to nodejs 8.11.1
FROM node:8.11.2-slim@sha256:cf568aee4325d0a46fb67d25c3faf779c4235f8800b5dddead87859f35931ec7

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git, unoconv and chinese fonts
RUN apt-get update && apt-get -t jessie-backports -y install \
    git \
    unoconv=0.7-1.1~bpo8+1 \
    ttf-wqy-zenhei \
    fonts-arphic-ukai \
    fonts-arphic-uming \
&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002
