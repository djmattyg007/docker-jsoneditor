FROM nginx:1.18.0-alpine AS builder
MAINTAINER djmattyg007

ENV JSONEDITOR_IMAGE_VERSION=2020.11.21-2
ENV JSONEDITORONLINE_VERSION=2020.11.21-2

RUN apk add --no-cache bash git yarn

RUN git clone https://github.com/djmattyg007/jsoneditoronline.git /tmp/jsoneditoronline

WORKDIR /tmp/jsoneditoronline

RUN git checkout "refs/tags/${JSONEDITORONLINE_VERSION}" && \
    ls -lah && \
    ./build.sh


FROM nginx:1.18.0-alpine

COPY --from=builder /tmp/jsoneditoronline/dist /usr/share/nginx/html
