# SBCL-SLYNK Dockerfile

This repository contains **Dockerfile** of [Slynk(SLY backend)](http://joaotavora.github.io/sly/#Connecting-to-a-remote-Lisp)
for Docker's automated build published to the [Docker Hub](https://hub.docker.com/r/andron94/dockerfile-sbcl-slynk/).

## Base Docker Image

+ [andron94/dockerfile-quicksbcl:1.4.0](https://hub.docker.com/r/andron94/dockerfile-quicksbcl/)

## Installation

1.  Install [Docker](https://docs.docker.com/engine/installation/).
2.  Download automated build from public Docker Hub Registry:
    ```sh
    docker pull andron94/dockerfile-sbcl-slynk:[TAG]
    ```

## Usage

### Create environment for `Common Lisp` development

The main purpose of this image is to be used as Common Lisp
development environment. Docker helps to forget about dependencies
and installation; Slynk helps to use Lisp REPL from an Emacs as usual.

```sh
# Run SBCL, create Slynk server on port 4005(specified in Dockerfile).
# Also, set up the connection between localhost(127.0.0.1)
# on port 4000(you can use any port you like) and Docker port 4005.
docker run -id -p 127.0.0.1:4000:4005 \
           --name test-sbcl-slynk andron94/dockerfile-sbcl-slynk:[TAG]
# Control Lisp image.
docker stop test-sbcl-slynk
docker start test-sbcl-slynk
docker restart test-sbcl-slynk
# And now you can connect to image from an Emacs:
# M-x sly-connect [localhost] [4000]
```

### Run `shell` session

```sh
docker run --rm -it --entrypoint /bin/sh andron94/dockerfile-sbcl-slynk:[TAG]
```

