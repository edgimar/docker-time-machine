# [Docker Time Machine Server](https://github.com/edgimar/docker-time-machine)

This repository can be used to build a docker container that is a minimal
configuration Time machine server for MacOS.  The container creates a network
resource that MacOS can back itself up to with Time Machine.

## Environment Variables

Various possible environment variables are listed in the docker-compse sample
below.  All of these variables are optional, but it is highly recommended to at
least set the `SMB_PASSWORD` variable to something other than the default value.

## Sample Docker Compose File

To build the container, create a file named `docker-compose.yaml` containing
something like contents below in a folder of your choosing, and from the same
folder, run `docker-compose build`.  This may take some time the first time it
is run.  To run the container in the foreground, use `docker-compose run`, or
`docker-compose run -d` to run in the background.

```yaml
---
version: "3.7"

services:
  time_machine:
    build: https://github.com/edgimar/docker-time-machine.git#main
    container_name: time-machine
    restart: unless-stopped
    network_mode: host
    environment:
      - PUID=0                  # user uid (advanced)
      - PGID=0                  # user gid (advanced)
      - SMB_NAME='Time Machine' # name of the server
      - SMB_USER=tm_user        # username to log into the server with
      - SMB_PASSWORD=secret     # password to log into the server with
      - SMB_MAX_SIZE_MB=0       # max reported share size (0 = no limit)
      - SMB_PORTS=445           # space-separated list of ports to listen on
    volumes:
      - /path/to/host/folder/for/storing/backup/data:/share
```
