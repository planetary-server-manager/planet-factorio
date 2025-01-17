# Configure server-settings.json
echo "Updating configuration..."
cd /server/factorio
if [ "$(ls /config/server-settings.json)" != "/config/server-settings.json" ]; then
    cp /server/factorio/data/server-settings.example.json /config/server-settings.json
fi
sed -i "s/\"name\": .*[^,]/\"name\": \"$SERVER_NAME\"/g" /config/server-settings.json
sed -i "s/\"description\": .*[^,]/\"description\": \"$DESCRIPTION\"/g" /config/server-settings.json
sed -i "s/\"max_players\": .*[^,]/\"max_players\": $MAX_PLAYERS/g" /config/server-settings.json
sed -i "s/\"public\": .*[^,]/\"public\": $PUBLIC/g" /config/server-settings.json
sed -i "s/\"lan\": .*[^,]/\"lan\": $LAN/g" /config/server-settings.json
sed -i "s/\"game_password\": .*[^,]/\"game_password\": \"$PASSWORD\"/g" /config/server-settings.json
sed -i "s/\"username\": .*[^,]/\"username\": \"$FACTORIO_USERNAME\"/g" /config/server-settings.json
sed -i "s/\"password\": .*[^,]/\"password\": \"$FACTORIO_PASSWORD\"/g" /config/server-settings.json
sed -i "s/\"token\": .*[^,]/\"token\": \"$FACTORIO_TOKEN\"/g" /config/server-settings.json