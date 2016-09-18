FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y cmake mingw-w64 sudo

CMD bash
