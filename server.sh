#!/bin/bash
echo "Starting..."
cat logo.txt
cd /server/factorio
ls /saves/$MAP_NAME.zip && \
./bin/x64/factorio --start-server /saves/$MAP_NAME.zip || \
./../../configure-server.sh
