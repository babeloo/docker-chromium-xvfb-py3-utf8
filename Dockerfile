FROM markadams/chromium-xvfb-py3

MAINTAINER Valkyrja <valkyrjasama@gmail.com>

ENV LANG en_US.UTF-8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e "s/# $LANG.*/$LANG.UTF-8 UTF-8/" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG && \
    apt-get clean && rm -rf /var/lib/apt/lists/*