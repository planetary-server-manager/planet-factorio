FROM ubuntu:latest

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    PUID=0 \
    PGID=0 \
    MAP_NAME=new-map

EXPOSE 34197/udp

RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl -y

# Download / Install latest dedicated server binary
RUN mkdir /server
RUN curl -L --max-redirs 1 "https://factorio.com/get-download/stable/headless/linux64" -o /server/factorio-dedicated-server.tar.xz && \
    tar -xf /server/factorio-dedicated-server.tar.xz -C /server && \
    rm /server/factorio-dedicated-server.tar.xz

COPY server.sh server.sh
COPY logo.txt logo.txt

RUN chmod +x server.sh

CMD ["/bin/bash", "server.sh"]