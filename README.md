# Factorio Dedicated Server
Containerized Factorio server for easy portability, deployment, and configuration.

> **Note**: This image is currently in development. While functional, there are still many rough edges and missing features.

# Summary
This is an all-in one container for running a Factorio server. Each version tag corresponds to the Factorio server version that comes bundled in. 

# Docker Compose
Docker Compose is recommended for easily repeatable deployments. Here is an example **docker-compose.yml**:
```
services:
    factorio-server:
        image: jelliefrontier/factorio-dedicated-server:latest
        container_name: factorio-server
        environment:
            - MAP_NAME=JellieMap
            - SERVER_NAME="Jellie Frontier Server"
            - DESCRIPTION="This is a containerized Factorio server deployed from the Jellie Frontier."
            - PUBLIC=true
            - STEAM=true
            - LAN=true
            - MAX_PLAYERS=0
            - PASSWORD=cleverpassword
            - WHITELIST=false
            - FACTORIO_USERNAME=
            - FACTORIO_PASSWORD=
            - FACTORIO_TOKEN=
        ports:
            - 34197:34197/udp
        volumes:
            - {CONFIG DIRECTORY}:/config
            - {SAVE DIRECTORY}:/saves
        restart: unless-stopped
```

> **Important**: Replace the environment variables and {DIRECTORY} placeholders with values that make sense for your setup.

# Environment Variables:
> **Note**: Any environment variables not specified will revert to the listed default value.

| Name | Default_Value | Description |
| --- | --- | --- |
| MAP_NAME | new-map| Name of the map save file (generated on first run) |
| SERVER_NAME | Jellie Frontier Server | Name of the server as it appears in the server list |
| PASSWORD |  | Password required to join the server. Leave empty for no password requirement. |
| MAX_PLAYERS | 0 | Sets the maximum concurrent players for the server. A value of **0** means no limit. |
| PUBLIC | true | The server will be listed on the public games list. Change to **false** to hide the server from public lists. You must also set valid **FACTORIO_USERNAME** and **FACTORIO_PASSWORD** for this to work. |
| STEAM | true | Enables the "Join Game" feature through Steam. Change to **false** to disable. |
| LAN | true | The server will be listed on your local network. Chance to **false** to hide from LAN. Clients can still connect via direct IP address. | 
| FACTORIO_USERNAME |  | Your factorio.com username. This is required for public game visibility. |
| FACTORIO_PASSWORD |  | Your factorio.com password. This is required for public game visibility. |
| FACTORIO_TOKEN |  | Authentication token from factorio.com. This can be used instead of **FACTORIO_USERNAME** and **FACTORIO_PASSWORD** |
| WHITELIST | false | When set to **false**, any player can join the server. When set to **true**, only players listed in the whitelist will be able join. | 

# Volumes
> **Important**: It is **highly** recommended that you map these volumes to your host machine. Otherwise all save data and configuration will be lost when the container is deleted/updated.

| Path | Description | 
| --- | --- |
| /saves | Location of the map save data will be stored. |
| /config | Location of the server configuration files (config.ini and server-settings.json) |