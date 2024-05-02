FROM debian:stable-slim

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    DEBIAN_FRONTEND=noninteractive \
    PUID=0 \
    PGID=0

RUN apt-get update \
    && apt-install neofetch \
    && apt-get autoremove -y

CMD ["neofetch"]