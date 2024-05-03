#!/bin/bash
echo "Starting..."
cat logo.txt
echo "Downloading latest server binary..."
mkdir /server
cd /server
curl -L --max-redirs 1 "https://factorio.com/get-download/stable/headless/linux64" -o factorio-dedicated-server.tar.xz && \
echo "Unpacking..." && \
tar -xf factorio-dedicated-server.tar.xz && \
rm factorio-dedicated-server.tar.xz
echo "Done."
echo "Starting server..."
cd factorio
./bin/x64/factorio --create $MAP_NAME && \
./bin/x64/factorio --start-server $MAP_NAME.zip