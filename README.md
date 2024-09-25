# Factorio Dedicated Server
Containerized cross-platform Factorio server for easy portability, deployment, and configuration.

# Summary
This is an all-in one container for running a Factorio server. It contains several features, including:

## Automatic Updates
The containter will automatically download the latest server version from [factorio.com](https://www.factorio.com/download) each time it (re)starts.

## Map Generation
The container will scan for existing map files in the **/saves** volume (see [volumes](#volumes)) on startup. If no map matching **MAP_NAME**.zip exists, it will generate a new one based on the **map-gen-settings.json** file. 

> **Note**: The **map-gen-settings.json** file will be generated in the **/config** volume based on your [environment variables](#environment-variables) and default values. If you have manually edited the **map-gen-settings.json** file, those settings will **not** be overridden by environment variables.

## Server Settings
This container stores the **server-settings.json** file in the **/config** volume. Default settings will be overridden by your [environment variables](#environment-variables) with each run of the container. If you have manually edited the **server-settings.json** file, those settings will **not** be overridden by environment variables.

# Environment Variables:
> **Note**: Any environment variables not specified will revert to the listed default value.

## Server Configuration
| Name | Default Value | Description |
| --- | --- | --- |
| SERVER_NAME | Jellie Frontier Server | Name of the server as it appears in the server list |
| PASSWORD |  | Password required to join the server. Leave empty for no password requirement. |
| MAX_PLAYERS | 0 | Sets the maximum concurrent players for the server. A value of **0** means no limit. |
| PUBLIC | true | The server will be listed on the public games list. Change to **false** to hide the server from public lists. You must also set valid **FACTORIO_USERNAME** and **FACTORIO_PASSWORD** (or **FACTORIO_TOKEN**) for this to work. |
| LAN | true | The server will be listed on your local network. Chance to **false** to hide from LAN. Clients can still connect via direct IP address. | 
| FACTORIO_USERNAME |  | Your factorio.com username. This is required for public game visibility. |
| FACTORIO_PASSWORD |  | Your factorio.com password. This is required for public game visibility. |
| FACTORIO_TOKEN |  | Authentication token from factorio.com. This can be used instead of **FACTORIO_PASSWORD** |
| WHITELIST | false | When set to **false**, any player can join the server. When set to **true**, only players listed in the whitelist will be able join. | 

## Map Generation
| Name | Default Value | Description |
| --- | --- | --- |
| MAP_NAME | new-map | Name of the map save file (generated on first run) |
| SEED | null | Set a seed number to generate a specific map. Otherwise, leave **null** to generate a random map. |
| PEACEFUL | false | When set to **true** the enemies don't begin fights, only responding if the player (or a structure) fires at them. When set to **false**, enemies will behave normally. |

# Volumes
> **Important**: It is **highly** recommended that you map these volumes to your host machine. Otherwise all save data and configuration will be lost when the container is deleted/updated.

| Path | Description | 
| --- | --- |
| /saves | Location of the map save data will be stored. |
| /config | Location of the server configuration files (server-settings.json and map-gen-settings.json) |

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
            - LAN=true
            - MAX_PLAYERS=0
            - PASSWORD=cleverpassword
            - WHITELIST=false
            - FACTORIO_USERNAME=
            - FACTORIO_PASSWORD=
            - FACTORIO_TOKEN=
            - PEACEFUL=false
            - SEED=null
        ports:
            - 34197:34197/udp
        volumes:
            - {CONFIG DIRECTORY}:/config
            - {SAVE DIRECTORY}:/saves
        restart: unless-stopped
```

> **Important**: Replace the environment variables and {DIRECTORY} placeholders with values that make sense for your setup.