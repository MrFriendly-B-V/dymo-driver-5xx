# Dymo Driver builder

Docker container for building the Dymo LabelWriter 5xx driver.

## Requirments
- Docker
- docker-compose
- GNU Make

## Usage
```
make
```
This will produce a `.deb` file which you can install with
```
sudo apt install ./out/*.deb
```