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
docker run --rm -it \
       -p 1080:1080 \
       -p 10022:22 \
       --privileged \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY blavoie/openconnect \
       /bin/bash
```

or simply call and see the defined function in ~/.dockerfunc for more complete example

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

You can also start SSHD, connect to it, and use socks from host:

```
/usr/sbin/sshd -D -p 22
```

### Outsite the container

Once sshd and tunnels are up in the container, we can establis an ssh connection with forwarding:

```
ssh ssh@localhost -p 10022 -D 1090
```

### Redirect DNS traffic to corporate internal resolvers (split-dns)

```
sshuttle \
     --dns \
     --to-ns=10.141.1.10 \
     -r ssh@localhost:10022\
     0/0
```
