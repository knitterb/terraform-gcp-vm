FROM hashicorp/terraform:light

RUN mkdir -p /terraform
WORKDIR /terraform

COPY . ./

CMD ["terraform", "init"]