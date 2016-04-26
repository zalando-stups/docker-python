FROM registry.opensource.zalan.do/stups/ubuntu:UPSTREAM
MAINTAINER Zalando SE

# Install python3.5
RUN apt-get update \
    && apt-get install -q -y --no-install-recommends python3.5 python3.5-dev python3-pip python3-setuptools python3-wheel gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# set python 3.5 as the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1 \
    && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
RUN pip3 install --upgrade pip requests

# make requests library use the Debian CA bundle (includes Zalando CA)
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

CMD python3

RUN purge.sh
