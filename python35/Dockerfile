FROM zalando/ubuntu:15.10-2
MAINTAINER Henning Jacobs <henning.jacobs@zalando.de>

RUN apt-get update && apt-get install -q -y python3.5 python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
RUN pip3 install --upgrade pip requests

ADD ./test.py /opt/test.py

# make requests library use the Debian CA bundle (includes Zalando CA)
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

CMD python3 /opt/test.py
