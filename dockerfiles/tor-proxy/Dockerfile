FROM alpine:latest
MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN apk --no-cache add \
	--repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
	tor

EXPOSE 9050

COPY torrc.default /etc/tor/torrc.default

RUN chown -R tor /etc/tor

USER tor

ENTRYPOINT [ "tor" ]
CMD [ "-f", "/etc/tor/torrc.default" ]
