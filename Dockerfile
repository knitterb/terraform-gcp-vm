FROM golang:alpine

ARG BUCKET
RUN echo $BUCKET
RUN echo ${BUCKET}

RUN apk update && \
    apk upgrade && \
    apk add terraform

RUN mkdir -p /terraform
WORKDIR /terraform

COPY *.tf ./
COPY credentials.json ./

RUN ["terraform", "version"]
RUN terraform init -backend=true -backend-config bucket=${BUCKET}

ENTRYPOINT [ "terraform" ]
