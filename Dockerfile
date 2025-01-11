FROM --platform=$BUILDPLATFORM ghcr.io/planetary-server-manager/planetary-base:latest AS build
ARG TARGETOS
ARG TARGETARCH

LABEL maintainer="renegadespork"

ENV MAP_NAME=new-map \
    SERVER_NAME="Planetary Factorio Server" \
    DESCRIPTION="This is a containerized Factorio server deployed using the Planetary Server Manager." \
    PUBLIC=true \
    STEAM=true \
    LAN=true \
    PASSWORD=\
    WHITELIST=false \
    FACTORIO_USERNAME= \
    FACTORIO_PASSWORD= \
    FACTORIO_TOKEN= \
    PEACEFUL=false \
    SEED=null

EXPOSE 34197/udp

RUN usermod -l factorio ubuntu
RUN mkdir /saves
RUN mkdir /config

COPY /scripts /scripts

RUN chmod -R 770 /scripts && \
    chown -R factorio /scripts

CMD ["/bin/bash", "/scripts/bootstrap.sh"]