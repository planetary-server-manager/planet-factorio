#!/bin/bash
echo "Starting..."
cat logo.txt
cd /server/factorio
ls /server/factorio/$MAP_NAME.zip && \
./bin/x64/factorio --start-server $MAP_NAME.zip || \
./bin/x64/factorio --create $MAP_NAME && \
./bin/x64/factorio --start-server $MAP_NAME.zip