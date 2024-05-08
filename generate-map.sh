# Create new map
if [ "$(ls /config/map-gen-settings.json)" != "/config/map-gen-settings.json" ]; then
    cp /server/factorio/data/map-gen-settings.example.json /config/map-gen-settings.json
fi
./bin/x64/factorio --create /saves/$MAP_NAME --map-gen-settings /config/map-gen-settings.json && \
# Run server
./bin/x64/factorio --start-server /saves/$MAP_NAME.zip --config /config/config.ini --server-settings /config/server-settings.json