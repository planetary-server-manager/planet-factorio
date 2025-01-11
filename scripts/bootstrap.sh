# Intro
cat logo.txt && \
if $AUTO_UPDATE ; then
    ./update.sh
else
    echo "Auto-updates disabled. Skipping."
fi
# Run server
./server.sh