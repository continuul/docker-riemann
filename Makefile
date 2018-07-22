RIEMANN_VERSION=0.3.1

.PHONY: all
all: riemann-$(RIEMANN_VERSION).tar.bz2
	cat riemann-${RIEMANN_VERSION}.tar.bz2 | bunzip2 | tar -x
	docker build -t continuul/riemann:${RIEMANN_VERSION} .
	rm -fr riemann-${RIEMANN_VERSION}

.PHONY: tarfile
riemann-$(RIEMANN_VERSION).tar.bz2:
	curl -Lo riemann-$(RIEMANN_VERSION).tar.bz2 https://github.com/riemann/riemann/releases/download/$(RIEMANN_VERSION)/riemann-$(RIEMANN_VERSION).tar.bz2
