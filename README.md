# Docker buildx Hello World
This is an example project to build multi-architecture Docker images
with buildx and test Github Actions on local machine.

## Installation

```bash
# Docker 19+ installed
https://docs.docker.com/engine/install/

# Install ACT locally to run Github Actions locally
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Configure Github Actions
<editor> .github/workflows/CI.yml

# Configure build script
<editor> build/build.hcl

# Dockerfile
<editor> hello/Dockerfile

# Configure environment variables
<editor> .env

# Configure secrets
Github project | Settings | Secrets | New Repository Secret...:
   DOCKER_USERNAME
   DOCKER_PASSWORD
```

## Usage

```bash
# Run all jobs
act

# Run single job (build image on local target)
act -j build-local

# Run with env file and secret file
act --env-file .env --secret-file .secret

# Create Docker containger from created erriez/hello image
#   -i      Keep STDIN open even if not attached
#   -t      Allocate a pseudo-TTY
#   --rm    Automatically remove the container when it exits
#   <image>:<version>
docker run -it --rm erriez/hello:latest

# Show Docker images
docker images

# Remove hello image
docker rmi erriez/hello:latest
```
