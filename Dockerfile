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
    SEED=null \
    TAGS="planetary,container"

EXPOSE 34197/udp

RUN usermod -l factorio ubuntu
RUN mkdir /saves
RUN mkdir /config

COPY /scripts /scripts

RUN chmod -R 770 /scripts && \
    chmod -R 770 /saves && \
    chmod -R 770 /config && \
    chmod -R 770 /server
    
RUN chown -R factorio /scripts && \
    chown -R factorio /saves && \
    chown -R factorio /config && \
    chown -R factorio /server

USER factorio

CMD ["/bin/bash", "/scripts/bootstrap.sh"]