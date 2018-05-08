# Setting the base to nodejs 8.11.1
FROM node:8.11.1-slim@sha256:1728ae1b001b3ef8889707bace1456ddc9e25eddcd2f94e612f3c8bde2cca5c3

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
