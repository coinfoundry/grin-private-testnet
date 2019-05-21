FROM ubuntu:bionic
RUN apt-get -y update && apt-get upgrade -y && apt-get install -y --no-install-recommends curl

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/mimblewimble/grin/releases/download/v1.1.0-beta.2/grin-v1.1.0-beta.2-linux-amd64.tar.gz \
    https://github.com/mimblewimble/grin-wallet/releases/download/v1.1.0-beta.3/grin-wallet-v1.1.0-beta.3-linux-amd64.tar.gz \
    /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    tar xf /tmp/grin-v1.1.0-beta.2-linux-amd64.tar.gz -C /tmp && \
    tar xf /tmp/grin-wallet-v1.1.0-beta.3-linux-amd64.tar.gz -C /tmp && \
    mv /tmp/grin/grin* /usr/bin && cp /tmp/grin-wallet/grin* /usr/bin

ADD rootfs /

RUN grin-wallet --usernet -p password init

ENTRYPOINT ["/init"]
VOLUME ["/data"]
