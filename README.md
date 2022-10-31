# [Docker Time Machine Server](https://github.com/edgimar/docker-time-machine)

Zero Configuration Time machine server for MacOS


-
## Environment Variables

These variables are optional, but it is highly recommended to at least set
the `SMB_PASSWORD` variable to something other than the default value.

| Variable and default val  | Description                            |
| ------------------------- | --------------------                   |
| `SMB_NAME='Time Machine'` | name of the server                     |
| `SMB_USER=tm_user`        | username to log into the server with   |
| `SMB_PASSWORD=secret`     | password to log into the server with   |
| `SMB_MAX_SIZE_MB=0`       | max reported share size (0 = no limit) |
| `PGID=0`                  | user gid (advanced)                    |
| `PUID=0`                  | user uid (advanced)                    |

## Sample Docker Compose File

```yaml
---
version: "3.7"

services:
  time_machine:
    image: edgimar/time-machine
    container_name: time-machine
    restart: unless-stopped
    network_mode: host
    volumes:
      - ./:/share
```

