# Factorio Dedicated Server
Containerized Factorio server for easy portability, deployment, and configuration.

> **Note**: This image is currently in development. While functional, there are still many rough edges and missing features.

# Summary
This is an all-in one container for running a Factorio server. Each version tag corresponds to the Factorio server version that comes bundled in. 

# Environment Variables:
| Name | Default_Value | Description |
| --- | --- | --- |
| MAP_NAME | new-map| Name of the map save file (generated on first run) |
| SERVER_NAME | Jellie Frontier Server | Name of the server as it appears in the server list |
| PUBLIC | true | The server will be listed on the public games list. Change to **false** to hide the server from public lists. |
| STEAM | true | Enables the "Join Game" feature through Steam. Change to **false** to disable. |
| LAN | true | The server will be listed on your local network. Chance to **false** to hide from LAN. Clients can still connect via direct IP address. | 
| MAX_PLAYERS | 0 | Sets the maximum concurrent players for the server. A value of **0** means no limit. |
| PASSWORD |  | Password required to join the server. Leave empty for no password requirement. |
| WHITELIST | false | When set to **false**, any player can join the server. When set to **true**, only players listed in the whitelist will be able join. | 

# Volumes
> **Important**: It is **highly** recommended that you map these volumes to your host machine. Otherwise all save data and configuration will be lost when the container is deleted/updated.

| Path | Description | 
| --- | --- |
| /saves | Location of the map save data will be stored. |
| /config | Location of the server configuration file (config.ini) |