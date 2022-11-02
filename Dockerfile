FROM ubuntu:latest

## Dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    gettext-base samba avahi-daemon supervisor

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

RUN /etc/cont-init.d/00-envsubst.sh && /etc/cont-init.d/00-smb.sh

## Cleanup
#RUN apt autoremove -y && \
#    apt clean

# this will include all conf files in /etc/supervisor/conf.d
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
