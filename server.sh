#!/bin/bash
cd /server/factorio
# Configure server-settings.json
if [ "$(ls /config/server-settings.json)" != "/config/server-settings.json" ]; then
    cp /server/factorio/data/server-settings.example.json /config/server-settings.json
fi
sed -i "s/\"name\": \"Name of the game as it will appear in the game listing\"/\"name\": \"$SERVER_NAME\"/g" /config/server-settings.json
sed -i "s/\"description\": \"Description of the game that will appear in the listing\"/\"description\": \"$DESCRIPTION\"/g" /config/server-settings.json
sed -i "s/\"max_players\": 0/\"max_players\": $MAX_PLAYERS/g" /config/server-settings.json
sed -i "s/\"public\": true/\"public\": $PUBLIC/g" /config/server-settings.json
sed -i "s/\"lan\": true/\"lan\": $LAN/g" /config/server-settings.json
sed -i "s/\"game_password\": \"\"/\"game_password\": \"$PASSWORD\"/g" /config/server-settings.json
sed -i "s/\"username\": \"\"/\"username\": \"$FACTORIO_USERNAME\"/g" /config/server-settings.json
sed -i "s/\"password\": \"\"/\"password\": \"$FACTORIO_PASSWORD\"/g" /config/server-settings.json
sed -i "s/\"token\": \"\"/\"token\": \"$FACTORIO_TOKEN\"/g" /config/server-settings.json
# Run server
ls /saves/$MAP_NAME.zip && \
./bin/x64/factorio --start-server /saves/$MAP_NAME.zip --config /config/config.ini --server-settings /config/server-settings.json || \
./../../generate-map.sh