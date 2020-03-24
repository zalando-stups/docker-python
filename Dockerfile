ARG UBUNTU_VERSION=latest

FROM registry.opensource.zalan.do/stups/ubuntu:$UBUNTU_VERSION
LABEL maintainer="Zalando SE"

# Install python 3.7 tools and dev packages
RUN apt-get update && \
    apt-get install -q -y --no-install-recommends \
                    python3.7 \
                    python3.7-dev \
                    python3-pip && \
    python3.7 -m pip install --no-cache-dir --upgrade --force-reinstall pip setuptools wheel && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set python 3.7 as the default python version and pip 3.7 as the default pip version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1 && \
    rm -f /usr/bin/pip3 && \
    update-alternatives --install /usr/bin/pip3 pip3 /usr/local/bin/pip3.7 1 && \
    update-alternatives --install /usr/bin/pip pip /usr/local/bin/pip3.7 1

# Check that default python and pip commands have correct versions
RUN python -V | grep 'Python 3.7' && \
    pip -V | grep '(python 3.7)'

# Make requests library use the Debian CA bundle (includes Zalando CA)
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

CMD python

RUN purge.sh
