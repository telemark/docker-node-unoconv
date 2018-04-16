# Setting the base to nodejs 8.11.1
FROM node:8.11.1-slim

# Adds backports
RUN awk '$1 ~ "^deb" { $3 = $3 "-backports"; print; exit }' /etc/apt/sources.list > /etc/apt/sources.list.d/backports.list

# Installs git, unoconv and chinese fonts
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports install -y git unoconv=0.7-1.1~bpo8+1 ttf-wqy-zenhei fonts-arphic-ukai fonts-arphic-uming && apt-get clean

ENTRYPOINT /usr/bin/unoconv --listener --server=0.0.0.0 --port=2002
