FROM alpine:3.8

LABEL maintainer="frank.giesecke@final-gene.de"

ENV OPENSSH_VERSION 0.0.0

RUN apk add --no-cache --virtual=.build-deps bash

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
        ca-certificates=20171114-r3 \
        gettext=0.19.8.1-r2 \
        openssh-client=7.7_p1-r3 \
        openssl=1.0.2q-r0

RUN mkdir -p ~/.ssh

RUN { \
    echo "Host *"; \
    echo "    StrictHostKeyChecking no"; \
} > ~/.ssh/config

RUN apk del .build-deps

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
