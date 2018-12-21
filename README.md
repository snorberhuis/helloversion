helloversion
==========
This repo provides a docker that can help you in experimenting with CI/CD pipelines for docker.
The `helloversion.go` provides a simple web server that prints a version.
The Dockerfile creates a Docker image from scratch and places the Hello World web server inside it.
You do not need golang to build it.

## Build
You can build without needing golang. Documentation is in the Makefile.
Run:

```
make
```

## Source
Dockerfile and helloworld http application was sourced from: https://github.com/adriaandejonge/helloworld