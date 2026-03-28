# Dymo Driver builder

Docker container for building the Dymo LabelWriter 5xx driver.
This has been tested on Ubuntu 24.04.

## Requirments
- Docker
- docker-compose
- GNU Make

## Usage
```
make install
```
This will install the driver and restart CUPS,

or
```
make build
```
This will only build the driver, and output it to `./out` as a DEB file

## License

MIT or Apache-2.0, at your option
