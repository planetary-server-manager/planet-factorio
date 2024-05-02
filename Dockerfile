FROM debian:latest

LABEL maintainer="thekraken8him"

ENV TIMEZONE=America/Los_Angeles \
    PUID=0 \
    PGID=0

RUN dpkg --add-architecture i386

RUN apt-get update
RUN apt-get install software-properties-common apt-transport-https curl -y
RUN curl -fSsL https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor | tee /usr/share/keyrings/winehq.gpg > /dev/null
RUN echo deb [signed-by=/usr/share/keyrings/winehq.gpg] http://dl.winehq.org/wine-builds/debian/ $(lsb_release -cs) main | tee /etc/apt/sources.list.d/winehq.list
RUN apt-get update && \
    apt-get install winehq-stable --install-recommends -y
RUN apt-get install neofetch -y

COPY runtime.sh runtime.sh
COPY logo.txt logo.txt

RUN chmod +x runtime.sh

CMD ["/bin/bash", "runtime.sh"]