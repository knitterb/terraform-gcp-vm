FROM golang:alpine

RUN apk update && \
    apk upgrade && \
    apk add terraform

RUN mkdir -p /terraform
WORKDIR /terraform

COPY *.tf ./

RUN ["terraform", "version"]
RUN ["terraform", "init"]

ENTRYPOINT [ "terraform" ]