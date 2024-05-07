# Create new map
./bin/x64/factorio --create /saves/$MAP_NAME && \
# Configure config.ini
sed -i "s/; name=/name=$SERVER_NAME/g" /config/config.ini
sed -i "s/; description=/description=$DESCRIPTION/g" /config/config.ini
sed -i "s/; visibility-public=true/visibility-public=$PUBLIC/g" /config/config.ini
sed -i "s/; visibility-steam=true/visibility-steam=$STEAM/g" /config/config.ini
sed -i "s/; visibility-lan=true/visibility-lan=$LAN/g" /config/config.ini
sed -i "s/; max-players=0/max-players=$MAX_PLAYERS/g" /config/config.ini
sed -i "s/; password=/password=$PASSWORD/g" /config/config.ini
sed -i "s/; enable-whitelist=false/enable-whitelist=$WHITELIST/g" /config/config.ini
# Configure server-settings.json
sed -i "s/\"name\": \"Name of the game as it will appear in the game listing\"/\"name\": \"$SERVER_NAME\"/g" /config/server-settings.json
sed -i "s/\"description\": \"Description of the game that will appear in the listing\"/\"description\": \"$DESCRIPTION\"/g" /config/server-settings.json
sed -i "s/\"max_players\": 0/\"max_players\": $MAX_PLAYERS/g" /config/server-settings.json
sed -i "s/\"public\": true/\"public\": $PUBLIC/g" /config/server-settings.json
sed -i "s/\"lan\": true/\"lan\": $LAN/g" /config/server-settings.json
sed -i "s/\"game_password\": \"\"/\"game_password\": \"$PASSWORD\"/g" /config/server-settings.json
# Run server
./bin/x64/factorio --start-server /saves/$MAP_NAME.zip --config /config/config.ini --server-settings /config/server-settings.json