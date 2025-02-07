.SILENT:
all: help

.PHONY: help
help:
	echo "- build 		Build driver"
	echo "- install		Build and install driver"
	echo "- help			Show this page"

.PHONY: build
build:
	mkdir -p ./out
	docker compose build
	docker compose run driver-builder
	echo "Done. Driver can be installed: $$(pwd)/out/lw5xx-linux_1.0-1_amd64.deb"

.PHONY: install
install: build
	sudo apt install $$(pwd)/out/*.deb