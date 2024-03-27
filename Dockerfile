FROM node:18.20.0-buster-slim

# Installs git, unoconv and chinese fonts
RUN apt-get update && apt-get -y install \
    git \
    unoconv=0.7-1.1 \
    ttf-wqy-zenhei \
    fonts-arphic-ukai \
    fonts-arphic-uming \
    fonts-indic \
&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002
