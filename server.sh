#!/bin/bash
echo "Starting..."
cat logo.txt
cd /server/factorio
ls /saves/$MAP_NAME.zip && \
./bin/x64/factorio --start-server /saves/$MAP_NAME.zip --config /config/config.ini --server-settings /config/server-settings.json || \
./../../configure-server.sh