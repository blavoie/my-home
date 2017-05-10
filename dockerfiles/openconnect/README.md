# openconnect

This image is used to connect to Cisco AnyConnect VPN protocol in an isolated way. 

It may be useful in case you don't want openconnect to modify your host routes.

This image was created for personnal use when trying to access corporate hosts under 10.x.x.x network over VPN from an internet cafe.
The cafe wifi address space was 10.x.x.x too, so was unable to do remote SSH/RDP to corporate hosts.

Thanks to docker to work around this network clash.

## How to build

```
docker build -t blavoie/openconnect .
```

## How to run

### Start the image

```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix --privileged -e DISPLAY blavoie/openconnect /bin/bash
```

or simply call the defined function in ~/.dockerfunc

```
openconnect
```

### Connect to VPN

Simply invoke openconnect or use command line arguments.

This will prompt your password.

```
openconnect -b -q -u USER VPN.YOUR.BUSINESS.COM
```

With this example, you can pass directoy your credentials.

```
echo -n <PASSWORD> | openconnect -b -q -u USER --passwd-on-stdin VPN.YOUR.BUSINESS.COM
```

### Use the tunnel!

From the running container, we can SSH or RDP to remote hosts.

SSH
```
ssh user@host
```

RDP

```
remmina >/dev/null 2>&1 &
```

Or simply forward ports and use a socks proxy:
```
ssh -D 0.0.0.0:1080 -C -f -N user@server -p 10022
```
