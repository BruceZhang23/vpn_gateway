unbound-dnscrypt
=================

[DNS cache](http://unbound.net) and [DNSCrypt](http://dnscrypt.org) for Docker.

## Image Creation

This example creates the image with the tag `garyhai/unbound-dnscrypt`, but you can change this to use your own username.

```
$ docker build -t="garyhai/unbound-dnscrypt" .
```

Alternately, you can run the following if you have *make* installed...

```
$ make
```

You can also specify custom variables by change the Makefile.

You can run it by the following command...

```
$ docker run --name unbound-dnscrypt -d -p 53:53 -p 53:53/udp garyhai/unbound-dnscrypt
```

You can also export dnscrypt port by the following command...

```
$ docker run --name unbound-dnscrypt -d -p 40:40 -p 40:40/udp -p 53:53 -p 53:53/udp garyhai/unbound-dnscrypt
```

To customize configuration of unbound, you may mount you config file or folder to /etc/unbound/conf.d/*.conf

```
folder contain config files

$ docker run --name unbound-dnscrypt -d -v /opt/conf.d:/etc/unbound/conf.d -p 53:53 -p 53:53/udp garyhai/unbound-dnscrypt

or single config file.

$ docker run --name unbound-dnscrypt -d -v /opt/my.conf:/etc/unbound/conf.d/my.conf -p 53:53 -p 53:53/udp garyhai/unbound-dnscrypt

```

Sample of config file:

```
server:
      local-data: "mail.example.com. 3600 IN MX 5 127.0.0.1"
      local-data: "example.com. 3600 IN A 127.0.0.1"
      local-zone: "example.com" redirect
      local-data: "example.com A 127.0.0.1"
      
      # If you are in China, turn DNSSEC off by this line:
       module-config: "iterator"
      
forward-zone:
      name: "example.com"
      forward-addr: 127.0.0.1@40

forward-zone:
      name: "."
      forward-addr: 8.8.8.8
      forward-first: no
```

## Environment variables

 - `RESOLVER_NAME`: Resolver name of dnscrypt. Default: `opendns`
