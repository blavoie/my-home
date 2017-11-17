# vi: set ft=dockerfile :

FROM docker.io/ubuntu:16.04
MAINTAINER Kazuhisa Hara <kazuhisya@gmail.com>

ENV TZ="JST-9" \
    DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install -y  curl --no-install-recommends
RUN curl -OLk https://deb.nodesource.com/setup_7.x && bash ./setup_7.x
RUN apt-get install -y \
      nodejs git rpm fakeroot --no-install-recommends
RUN npm install -g grunt-cli

RUN git clone --depth 1 https://github.com/BoostIO/Boostnote/ /boostnote &&\
    useradd -m mock && chown -R mock.mock /boostnote

USER mock
WORKDIR /boostnote

RUN npm install
RUN grunt build
