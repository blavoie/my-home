# torproxy

This image run a tor socks proxy in a container.


## How to build

```
docker build -t blavoie/tor-proxy .
```

## How to run

```
docker run -d \
	--restart always \
	-v /etc/localtime:/etc/localtime:ro \
	-p 9050:9050 \
	--name tor-proxy \
	blavoie/tor-proxy
```

or simply call the defined function in ~/.dockerfunc

```
tor-proxy
```

## Credits

https://github.com/jfrazelle/dockerfiles
