#!/bin/bash
echo "Starting..."
cat logo.txt
echo "Downloading latest server binary..."
cd /server/factorio
./bin/x64/factorio --create $MAP_NAME && \
./bin/x64/factorio --start-server $MAP_NAME.zip
