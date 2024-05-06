./bin/x64/factorio --create /saves/$MAP_NAME && \
sed -i "s/; name=/; name=$SERVER_NAME/g" /config/config.ini
./bin/x64/factorio --start-server /saves/$MAP_NAME.zip