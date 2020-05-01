VERSION:=2.3

.PHONY: build
build:
	docker build --no-cache --rm --tag udovicic/magepack:${VERSION} .

.PHONY: test
test:
	docker run --rm udovicic/magepack:${VERSION} magepack -v
