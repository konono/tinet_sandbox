FROM ubuntu:22.04
MAINTAINER kono <kono@ms1.kononet.jp>

# (base=slankdev/ubuntu18:04) basic package install
RUN apt update \
 && apt install -y curl sudo lsb-release lsb-core libatm1 libc-ares2 libelf1 libmnl0 libpopt0 libxtables12 logrotate libjson-c-dev libreadline-dev \
 && curl -s https://deb.frrouting.org/frr/keys.gpg | sudo tee /usr/share/keyrings/frrouting.gpg > /dev/null \
 && FRRVER="frr-8" \
 && echo deb '[signed-by=/usr/share/keyrings/frrouting.gpg]' https://deb.frrouting.org/frr $(lsb_release -s -c) $FRRVER | sudo tee -a /etc/apt/sources.list.d/frr.list \
 && sudo apt update \
 && sudo apt install -y frr frr-pythontools \
 && sed -i -e 's/=no/=yes/g' /etc/frr/daemons
