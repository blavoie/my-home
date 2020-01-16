FROM ubuntu:18.04
MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y wget \
                       git \
                       gconf2 \
                       gconf-service \
                       gvfs-bin \
                       libgtk2.0-0 \
                       libnss3 \
                       libxtst6 \
                       python \
                       xdg-utils \
                       libnotify4 \
                       libxss1 \
                       libasound2 \
 && wget https://github.com/BoostIO/boost-releases/releases/download/v0.11.15/boostnote_0.11.15_amd64.deb -O boostnote.deb \
 && dpkg -i boostnote.deb \
 && rm -rf *.deb \
 && rm -rf /var/lib/apt/lists/* 

ENV GOSU_VERSION 1.9
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \                                                                                                                    
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \                                                                                                                 
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates wget

COPY docker-entrypoint.sh /docker-entrypoint.sh
    
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/boostnote"]
    
