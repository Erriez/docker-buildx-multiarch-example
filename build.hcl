variable "DOCKER_ORG" {
  default = "erriez"
}
variable "DOCKER_PREFIX" {
  default = ""
}
variable "IMAGE_VERSION" {
  default = "latest"
}

group "default" {
  targets = [
    "alpine-hello",
    "ubuntu-hello"
  ]
}

target "defaults" {
  platforms = [ "linux/amd64", "linux/arm64", "linux/arm/v7" ]
  dockerfile="Dockerfile"
}

function "tag" {
  params = [image_name]
  result = "${DOCKER_ORG}/${DOCKER_PREFIX}${image_name}:${IMAGE_VERSION}"
}

target "alpine-hello" {
  inherits = ["defaults"]
  context = "alpine-hello"
  tags = [ tag("alpine-hello") ]
}

target "ubuntu-hello" {
  inherits = ["defaults"]
  context = "ubuntu-hello"
  tags = [ tag("ubuntu-hello") ]
}
