FROM alpine:3.18.4

LABEL maintainer="frank.giesecke@final-gene.de"

# hadolint ignore=DL3018
RUN apk add --no-cache bash

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache \
        ca-certificates \
        gettext \
        git \
        openssh-client \
        openssl \
    && mkdir -p ~/.ssh \
    && { \
        echo "Host *"; \
        echo "    StrictHostKeyChecking no"; \
    } > ~/.ssh/config \
    && chmod -R u=rwX,g=,o= /root/.ssh

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
