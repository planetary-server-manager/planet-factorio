# 🪐 Planetary Factorio Server
PSM container image for Factorio. It provides tight integration with the [PSM API](https://github.com/planetary-server-manager/api-server).

# Auto Updates
Automatic updates are turned **on** by default. This will ensure the container always downloads the latest server version every time it starts. If you would like to stay on your current version and disable auto updates, set **AUTO_UPDATE** to **false**.

> **Note**: **AUTO_UPDATE** must be set to **true** for the first run of the container, otherwise no server will be downloaded.

## Map Generation
The container will scan for existing map files in the **/saves** volume (see [volumes](#volumes)) on startup. If no map matching **MAP_NAME**.zip exists, it will generate a new one based on the **map-gen-settings.json** file. 

> **Note**: The **map-gen-settings.json** file will be generated in the **/config** volume based on your [environment variables](#environment-variables) and default values. If you have manually edited the **map-gen-settings.json** file, those settings will **not** be overridden by environment variables.

## Server Settings
This container stores the **server-settings.json** file in the **/config** volume. Settings will be overwritten by your [environment variables](#environment-variables) with each run of the container.

# Environment Variables:
> **Note**: Any environment variables not specified will revert to the listed default value.

## Server Configuration
| Name | Default Value | Description |
| --- | --- | --- |
| SERVER_NAME | Planetary Factorio Server | Name of the server as it appears in the server list |
| PASSWORD |  | Password required to join the server. Leave empty for no password requirement. |
| MAX_PLAYERS | 0 | Sets the maximum concurrent players for the server. A value of **0** means no limit. |
| PUBLIC | true | The server will be listed on the public games list. Change to **false** to hide the server from public lists. You must also set valid **FACTORIO_USERNAME** and **FACTORIO_PASSWORD** (or **FACTORIO_TOKEN**) for this to work. |
| LAN | true | The server will be listed on your local network. Chance to **false** to hide from LAN. Clients can still connect via direct IP address. **Note**: You will need to add `network_mode: host` to your docker compose for you server to show up on LAN. | 
| FACTORIO_USERNAME |  | Your factorio.com username. This is required for public game visibility. |
| FACTORIO_PASSWORD |  | Your factorio.com password. This is required for public game visibility. |
| FACTORIO_TOKEN |  | Authentication token from factorio.com. This can be used instead of **FACTORIO_PASSWORD** |
| WHITELIST | false | When set to **false**, any player can join the server. When set to **true**, only players listed in the whitelist will be able join. | 
| TAGS | "planetary, container" | List of comma-separated tags that will show up in the server browser. |

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
        image: ghcr.io/planetary-server-manager/planet-factorio:latest
        container_name: factorio-server
        environment:
            - MAP_NAME=new-map
            - SERVER_NAME="Planetary Factorio Server"
            - DESCRIPTION="This is a containerized Factorio server deployed using the Planetary Server Manager."
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