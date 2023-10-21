FROM nikolaik/python-nodejs:python3.10-nodejs18-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/serverless/github-action"
LABEL homepage="https://github.com/serverless/github-action"
LABEL maintainer="Serverless, Inc. <hello@serverless.com> (https://serverless.com)"

LABEL "com.github.actions.name"="Serverless"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

# fixme: this should be part of the base container
RUN wget https://go.dev/dl/go1.21.3.linux-amd64.tar.gz  && \
  tar -xvf go1.21.3.linux-amd64.tar.gz
ENV PATH="${PATH}:/go/bin/"

RUN npm i -g serverless@3.x
ENTRYPOINT ["serverless"]