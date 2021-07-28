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
    targets = ["hello"]
}

target "hello" {
    context = "hello"
    dockerfile = "Dockerfile"
    tags = ["${DOCKER_ORG}/${DOCKER_PREFIX}hello:${IMAGE_VERSION}"]
}

