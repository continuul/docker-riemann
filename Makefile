RIEMANN_VERSION=0.3.1

.PHONY: all
all: latest

.PHONY: tarfile
riemann-$(RIEMANN_VERSION).tar.bz2:
	curl -Lo riemann-$(RIEMANN_VERSION).tar.bz2 https://github.com/riemann/riemann/releases/download/$(RIEMANN_VERSION)/riemann-$(RIEMANN_VERSION).tar.bz2

.PHONY: image
image: riemann-$(RIEMANN_VERSION).tar.bz2
	cat riemann-${RIEMANN_VERSION}.tar.bz2 | bunzip2 | tar -x
	docker build -t continuul/riemann:${RIEMANN_VERSION} .
	rm -fr riemann-${RIEMANN_VERSION}

.PHONY: latest
latest: image
	docker tag continuul/riemann:${RIEMANN_VERSION} continuul/riemann:latest

.PHONY: push
push: latest
	docker push continuul/riemann:${RIEMANN_VERSION}
	docker push continuul/riemann:latest
