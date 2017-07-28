FROM registry.opensource.zalan.do/stups/ubuntu:latest
MAINTAINER Zalando SE

# Install python3.6
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository -y ppa:fkrull/deadsnakes \
    && apt-get update \
    && apt-get install -q -y --no-install-recommends python3.6 python3.6-dev python3-pip python3-setuptools python3-wheel gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# set python 3.6 as the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 \
    && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
RUN pip3 install --upgrade pip requests setuptools

# make requests library use the Debian CA bundle (includes Zalando CA)
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

CMD python3

RUN purge.sh
