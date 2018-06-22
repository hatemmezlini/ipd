# ipd

[![Build Status](https://travis-ci.org/mpolden/ipd.svg)](https://travis-ci.org/mpolden/ipd)

A simple service for looking up your IP address. This is a small modification of the code that powers
https://ifconfig.co

* ASN Autonomous system number is added in json to designate the carrier, datacenter or whatever organization behind the IP
* You can also look up any IP when adding it as a parameter

## Usage

Just the business, please:

```
$ curl example.com
127.0.0.1

$ http example.com
127.0.0.1

$ wget -qO- example.com
127.0.0.1

$ fetch -qo- http://example.com
127.0.0.1
```

Country, city and asn lookup:

```
$ http example.com/country
Elbonia

$ http example.com/city
Bornyasherk

$http example.com/asn
Telstra Pty Ltd
```

As JSON:

```
$ http --json example.com
{
  "asn": "Telstra Pty Ltd",
  "city": "Bornyasherk",
  "country": "Elbonia",
  "ip": "127.0.0.1",
  "ip_decimal": 2130706433
}
```

You can also lookup any IP address by adding it in url as parameter:

```
$ http --json example.com?ip=89.12.59.17
{
  "asn": "Telefonica Germany",
  "city": "Filderstadt",
  "country": "Germany",
  "ip": "89.12.59.17",
  "ip_decimal": 1493973777
}
```

## Features

* Easy to remember domain name
* Supports HTTPS
* Open source under the [BSD 3-Clause license](https://opensource.org/licenses/BSD-3-Clause)
* Fast
* Supports typical CLI tools (`curl`, `httpie`, `wget` and `fetch`)
* JSON output (optional)
* Country and city lookup through the MaxMind GeoIP database

## Why?

* To scratch an itch
* An excuse to use Go for something
* Faster than ifconfig.me

## Building

Compiling requires the [Golang compiler](https://golang.org/) to be installed.
This application can be installed by using `go get`:

`go get github.com/hatemmezlini/ipd`

### Usage

```
$ ipd -h
Usage:
  ipd [OPTIONS]

Application Options:
  -f, --country-db=FILE                                  Path to GeoIP country database
  -c, --city-db=FILE                                     Path to GeoIP city database
  -a, --asn-db=FILE                                      Path to GeoIP asn database
  -l, --listen=ADDR                                      Listening address (default: :8080)
  -r, --reverse-lookup                                   Perform reverse hostname lookups
  -p, --port-lookup                                      Enable port lookup
  -t, --template=FILE                                    Path to template (default: index.html)
  -H, --trusted-header=NAME                              Header to trust for remote IP, if present (e.g. X-Real-IP)
  -L, --log-level=[debug|info|warn|error|fatal|panic]    Log level to use (default: info)

Help Options:
  -h, --help                                             Show this help message
```
