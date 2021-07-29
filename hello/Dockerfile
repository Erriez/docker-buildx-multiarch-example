FROM --platform=$TARGETPLATFORM alpine:3.13
ARG BUILDPLATFORM
ARG TARGETPLATFORM

RUN echo "Building on $BUILDPLATFORM for $TARGETPLATFORM!"

CMD arch && echo "Hello World from container!"
