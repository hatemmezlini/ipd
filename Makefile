all: deps test vet install

fmt:
	go fmt ./...

test:
	go test ./...

vet:
	go vet ./...

deps:
	go get -d -v ./...

install:
	go install

get-geoip-dbs:
	curl -s http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz | gunzip > GeoLite2-Country.mmdb
	curl -s http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz | gunzip > GeoLite2-City.mmdb
	wget -qO- http://geolite.maxmind.com/download/geoip/database/GeoLite2-ASN.tar.gz | tar -xz; mv GeoLite2-ASN_*/GeoLite2-ASN.mmdb GeoLite2-ASN.mmdb; rm -rf GeoLite2-ASN_*
