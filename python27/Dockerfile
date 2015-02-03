FROM zalando/ubuntu:14.04.1-1

RUN apt-get update && apt-get -y install python-pip python-dev libev4 libev-dev python-psycopg2 libpq-dev python-dev libldap2-dev libsasl2-dev libssl-dev

ADD requirements.txt /requirements.txt
RUN pip install -r /requirements.txt && rm requirements.txt
