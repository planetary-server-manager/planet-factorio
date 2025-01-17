# Intro
cat logo.txt
cd /scripts
if $AUTO_UPDATE ; then
    ./update.sh
else
    echo "Auto-updates disabled. Skipping."
fi
# Run config
./config.sh && \
# Run server if map exists, else generate map.
ls /saves/$MAP_NAME.zip && \
./server.sh || \
./generate-map.sh