FROM golang:alpine

ARG BUCKET

RUN apk update && \
    apk upgrade && \
    apk add terraform

RUN mkdir -p /terraform
WORKDIR /terraform

COPY *.tf ./
COPY credentials.json ./

RUN ["terraform", "version"]
RUN ["terraform", "init", "-backend-config bucket=$BUCKET"]

ENTRYPOINT [ "terraform" ]