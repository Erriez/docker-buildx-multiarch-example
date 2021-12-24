# Docker buildx bake Hello World

**IMPORTANT NOTE: WORK IN PROGRESS**

This is an example project to build multi-architecture Docker images
with buildx and test Github Actions on a local machine with Act.

## Installation

```bash
# Install Docker v20+
https://docs.docker.com/engine/install/
```

## Directory / file structure

```bash
# Configure Github Actions
.github/workflows/CI.yml

# Configure configuration script for docker buildx bake
build.hcl

# Example builds cript
build.sh

# Docker example project files
alpine-hello/Dockerfile
ubuntu-hello/Dockerfile

# Environment variables
.env
.secret
```

## Build locally

```bash
# Build all images for all platforms
docker buildx bake -f build.hcl

# Build one image for all platforms
docker buildx bake -f build.hcl alpine-hello

# Build all images for one or more platforms
docker buildx bake -f build.hcl --set *.platform=linux/amd64,linux/arm64,linux/arm/v7

# Build all images for current platform and load into local Docker registry (--load option)
docker buildx bake -f build.hcl --load

# Build all images for all platforms and push to registry (--push option)
docker login [registry]
docker buildx bake -f build.hcl --push
```

Build script:

```bash
# Build all images for all platforms
./build.sh [arguments]
```

## Run locally

Run image from registry. Output on AMD64:

```bash
docker run -it --rm erriez/alpine-hello:latest
x86_64
Hello World from Alpine container!

docker run -it --rm erriez/ubuntu-hello:latest
x86_64
Hello World from Ubuntu container!
```

Output on ARM64 (for example Raspberry Pi 4): `aarch64`.

## Test Github Actions locally with Act

```bash
# Install Act locally to run Github Actions locally
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Run all jobs
act

# Run single job
act -j Build

# Run with env file and secret file
act --env-file .env --secret-file .secret

# .env file
DOCKER_ORG=<your_name>
DOCKER_PREFIX=
IMAGE_VERSION=latest

# .secret file
DOCKERHUB_USERNAME=<your_name>
DOCKERHUB_TOKEN=<your_password>

# Create Docker containger from created image
#   -i      Keep STDIN open even if not attached
#   -t      Allocate a pseudo-TTY
#   --rm    Automatically remove the container when it exits
#   <image>:<version>
docker run -it --rm erriez/hello-alpine:latest
docker run -it --rm erriez/ubuntu-alpine:latest

# Show Docker images
docker images

# Remove hello image
docker rmi erriez/alpine-hello:latest
docker rmi erriez/ubuntu-hello:latest
```

# Github Actions

```bash
# Configure secrets
Github project | Settings | Secrets | New Repository Secret...:
   DOCKER_ORG
   DOCKER_USERNAME
   DOCKER_PASSWORD
```
