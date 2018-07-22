FROM openjdk:jre-alpine

ENV RIEMANN_VERSION 0.3.1

LABEL "name"="riemann" \
      "version"="$RIEMANN_VERSION" \
      "summary"="A network event stream processing system, in Clojure." \
      "description"="Riemann aggregates events from your servers and applications with a powerful stream processing language." \
      "maintainer"="Robert Buck, buck.robert.j@gmail.com"

COPY riemann-${RIEMANN_VERSION} /riemann

RUN set -eux \
    && apk add --no-cache curl

WORKDIR /riemann

RUN sed -ie 's/env bash/env sh/' bin/riemann

RUN sed -ie 's/127.0.0.1/0.0.0.0/' etc/riemann.config

EXPOSE 5555/tcp 5555/udp 5556

CMD [ "bin/riemann", "etc/riemann.config" ]
