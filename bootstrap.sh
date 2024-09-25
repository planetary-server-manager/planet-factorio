# Intro
echo "Welcome to the" && \
cat logo.txt && \
# Download and install server
echo "Downloading latest server binary..."
curl -L --max-redirs 1 "https://factorio.com/get-download/stable/headless/linux64" -o /server/factorio-dedicated-server.tar.xz && \
tar -xf /server/factorio-dedicated-server.tar.xz -C /server && \
rm /server/factorio-dedicated-server.tar.xz
# Organize config files
sed -i 's/__PATH__executable__\/..\/..\/config/\/config/g' /server/factorio/config-path.cfg && \
# Run server
./server.sh