# Configure server-settings.json
echo "Updating configuration..."
cd /config
# Copy new config if needed
if [ "$(ls server-settings.json)" != "server-settings.json" ]; then
    cp /server/factorio/data/server-settings.example.json server-settings.json
fi
# Build tag array
IFS=',' read -ra TAGS_ARR <<< "$TAGS"
TAGS_ARRAY=$(jq --compact-output --null-input '$ARGS.positional' --args -- "${TAGS_ARR[@]}")
# Apply config
sed -i "s/\"name\": .*[^,]/\"name\": \"$SERVER_NAME\"/g" server-settings.json
sed -i "s/\"description\": .*[^,]/\"description\": \"$DESCRIPTION\"/g" server-settings.json
sed -i "s/\"tags\": .*[^,]/\"tags\": $TAGS_ARRAY/g" server-settings.json
sed -i "s/\"max_players\": .*[^,]/\"max_players\": $MAX_PLAYERS/g" server-settings.json
sed -i "s/\"public\": .*[^,]/\"public\": $PUBLIC/g" server-settings.json
sed -i "s/\"lan\": .*[^,]/\"lan\": $LAN/g" server-settings.json
sed -i "s/\"game_password\": .*[^,]/\"game_password\": \"$PASSWORD\"/g" server-settings.json
sed -i "s/\"username\": .*[^,]/\"username\": \"$FACTORIO_USERNAME\"/g" server-settings.json
sed -i "s/\"password\": .*[^,]/\"password\": \"$FACTORIO_PASSWORD\"/g" server-settings.json
sed -i "s/\"token\": .*[^,]/\"token\": \"$FACTORIO_TOKEN\"/g" server-settings.json