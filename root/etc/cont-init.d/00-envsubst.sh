#!/bin/bash

set -eu
set -o pipefail


sub() {
  local envs="$1"
  local inpath="$2"
  local outpath="$3"
  local temp="$(envsubst "$envs" < "$inpath")"
  printf '%s' "$temp" > "$outpath"
}

export HOST_NAME="$(hostname)"

sub '${SMB_USER},${SMB_NAME},${SMB_MAX_SIZE_MB},${SMB_PORTS}' /etc/samba/smb.conf.tpl /etc/samba/smb.conf
