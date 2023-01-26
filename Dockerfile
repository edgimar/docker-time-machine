FROM ubuntu:latest

## Dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    gettext-base samba avahi-daemon supervisor vim-tiny

## Scripts
COPY root /
RUN mkdir -p /var/log/supervisor
ENV PGID=0 \
    PUID=0 \
    SMB_NAME='Time Machine Server' \
    SMB_USER=tm_user \
    SMB_PASSWORD=secret \
    SMB_MAX_SIZE_MB=0
VOLUME ["/share"]

## Cleanup
#RUN apt autoremove -y && \
#    apt clean

# this will include all conf files in /etc/supervisor/conf.d
CMD ["/bin/sh", "entrypoint.sh"]
