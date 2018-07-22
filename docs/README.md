# Supported tags and respective `Dockerfile` links

-	[`0.3.1`, `latest` (*Dockerfile*)](https://github.com/continuul/docker-riemann/blob/master/Dockerfile)

# Quick reference

-	**Where to file issues**:  
	[https://github.com/continuul/docker-riemann/issues](https://github.com/continuul/docker-riemann/issues)

-	**Maintained by**:  
	[Continuul](https://github.com/continuul/)

-	**Supported architectures**: ([more info](https://github.com/docker-library/official-images#architectures-other-than-amd64))  
	[`amd64`](https://hub.docker.com/r/continuul/riemann/)

-	**Published image artifact details**:  
	[repo-info repo's `repos/consul/` directory](https://github.com/docker-library/repo-info/blob/master/repos/consul) ([history](https://github.com/continuul/docker-riemann/commits/master))  
	(image metadata, transfer size, etc)

-	**Source of this description**:  
	[docs repo's `docs/` directory](https://github.com/continuul/docker-riemann/docs/tree/master) ([history](https://github.com/docker-library/docs/commits/master/consul))

-	**Supported Docker versions**:  
	[the latest release](https://github.com/docker/docker-ce/releases/latest) (down to 1.6 on a best-effort basis)

# Riemann

A network event stream processing system, in Clojure.

Riemann aggregates events from your servers and applications with a powerful stream processing language.

Provides an Alpine-based Riemann Docker.

-	[Riemann](http://riemann.io/)
-	[Riemann on GitHub](https://github.com/riemann/riemann)
-	[Riemann Docker on GitHub](https://github.com/continuul/docker-riemann)

# Rieman

A network event stream processing system, in Clojure.

Riemann aggregates events from your servers and applications with a powerful stream processing language.

# Using the Container

We chose Alpine as a lightweight base with a reasonably small surface area for security concerns, but with enough functionality for development, interactive debugging, and useful health, watch, and exec scripts running under Riemann in the container. As of Riemann 0.3.1, the image also includes `curl` since it is so commonly used for health checks.

Running the Riemann container with no arguments will give you a Riemann server running against the built-in riemann.config.

This will run with the default configuration from `etc/riemann.config`.

```bash
docker run -d -p 5555:5555 -p 5555:5555/udp -p 5556:5556 continuul/riemann
```

# Using a Custom Riemann Configuration File

The container has a Riemann configuration directory set up at `/riemann/etc` and the server will load any configuration files placed here by binding a volume or by composing a new image and adding files.

Alternatively, if `/my/custom/riemann.config` is the path and name of your custom configuration file, you can start your Riemann container like this (note that only the directory path of the custom config file is used in this command):

```bash
$ docker run --name some-riemann \
    -v /my/custom:/riemann/etc \
    -p 5555:5555 -p 5555:5555/udp -p 5556:5556 \
    -d continuul/riemann:tag
```

# License

View [license information](https://raw.githubusercontent.com/continuul/docker-riemann/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in [the `repo-info` repository's `docs/` directory](https://github.com/continuul/docker-riemann/tree/master/docs).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
