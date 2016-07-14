FROM debian:wheezy

RUN apt-get update \
    && apt-get install -qqy --force-yes --no-install-recommends logrotate libsasl2-2 ca-certificates\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD https://cloud.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent_5.1.0.323-1_amd64.deb mms.deb
RUN dpkg -i mms.deb && rm mms.deb

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
