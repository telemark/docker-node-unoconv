FROM node:10.20.1-buster-slim

# Adds backports
#RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list
#RUN deb http://deb.debian.org/debian jessie-backports main
#RUN echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list
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
