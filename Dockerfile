FROM arm32v7/ubuntu:23.04

VOLUME /config
WORKDIR /usr/src/app

RUN apt-get update && apt-get install python3-pip libglib2.0-dev make gcc bluez -y && \
    pip3 install --no-cache-dir mitemp_bt bluepy paho-mqtt psutil && \
    apt-get clean all

RUN groupadd -g 9999 appuser && \
    useradd -r -u 9999 -g appuser appuser && \
    chown appuser.appuser /usr/src/app/
USER appuser

COPY . /usr/src/app/
