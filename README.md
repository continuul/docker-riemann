# docker-riemann

A network event stream processing system, in Clojure.

## Riemann

Riemann aggregates events from your servers and applications with a powerful stream processing language.

Provides a Slim Riemann Docker.

## Usage

This will run with the default configuration from `etc/riemann.config`.

```bash
docker run -d -p 5555:5555 -p 5555:5555/udp -p 5556:5556 continuul/riemann
```

Custom config volumes should be mounted on /app/etc, e.g.:

```bash
docker run -d \
  -p 5555:5555 \
  -p 5555:5555/udp \
  -p 5556:5556 \
  -v $HOME/riemann/etc:/app/etc \
  continuul/riemann 
```
