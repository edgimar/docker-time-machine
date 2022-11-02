#!/bin/bash
# perform any needed config-file substitution from env variables
/etc/cont-init.d/00-envsubst.sh
/etc/cont-init.d/00-smb.sh

# this will include all conf files in /etc/supervisor/conf.d
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

