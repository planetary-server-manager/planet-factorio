FROM --platform=$BUILDPLATFORM ubuntu:latest AS build
ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    PUID=0 \
    PGID=0 \
    MAP_NAME=new-map \
    SERVER_NAME="Jellie Frontier Server" \
    DESCRIPTION="This is a containerized Factorio server deployed from the Jellie Frontier." \
    PUBLIC=true \
    STEAM=true \
    LAN=true \
    MAX_PLAYERS=0 \
    PASSWORD=\
    WHITELIST=false \
    FACTORIO_USERNAME= \
    FACTORIO_PASSWORD= \
    FACTORIO_TOKEN= \
    PEACEFUL=false \
    SEED=null

EXPOSE 34197/udp

RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl -y

RUN mkdir /server
RUN mkdir /saves
RUN mkdir /config

# Download / Install latest dedicated server binary
RUN curl -L --max-redirs 1 "https://factorio.com/get-download/stable/headless/linux64" -o /server/factorio-dedicated-server.tar.xz && \
    tar -xf /server/factorio-dedicated-server.tar.xz -C /server && \
    rm /server/factorio-dedicated-server.tar.xz

# Organize config files
RUN sed -i 's/__PATH__executable__\/..\/..\/config/\/config/g' /server/factorio/config-path.cfg

COPY server.sh server.sh
COPY generate-map.sh generate-map.sh
COPY logo.txt logo.txt

RUN chmod +x server.sh
RUN chmod +x generate-map.sh

CMD ["/bin/bash", "server.sh"]