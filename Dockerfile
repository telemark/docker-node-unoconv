FROM node:10.13.0-slim@sha256:d66b1e35329ecf02f1e248c7e19f52a8b10529080e10f4290813cebec46cb851

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
