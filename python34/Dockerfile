FROM zalando/ubuntu:15.04-1
MAINTAINER Henning Jacobs <henning.jacobs@zalando.de>

RUN apt-get update && apt-get install -q -y python3-pip
RUN pip3 install --upgrade pip requests

# make requests library use the Debian CA bundle (includes Zalando CA)
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
