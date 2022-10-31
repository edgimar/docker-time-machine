FROM ubuntu:latest

RUN mkdir /_install

ENTRYPOINT ["/init"]


## Dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    gettext-base samba avahi-daemon


## Scripts
COPY root /
ENV PGID=0 \
    PUID=0 \
    SMB_NAME='Time Machine Server' \
    SMB_USER=tm_user \
    SMB_PASSWORD=secret \
    SMB_MAX_SIZE_MB=0
VOLUME ["/share"]


## Cleanup
RUN apt autoremove -y && \
    apt clean && \
    rm -r /_install
