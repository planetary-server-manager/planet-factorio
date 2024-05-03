FROM ubuntu:latest

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    PUID=0 \
    PGID=0 \
    MAP_NAME=new-map

EXPOSE 34197

RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl -y

COPY runtime.sh runtime.sh
COPY logo.txt logo.txt

RUN chmod +x runtime.sh

CMD ["/bin/bash", "runtime.sh"]