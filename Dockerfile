FROM alpine:3.11

LABEL maintainer="frank.giesecke@final-gene.de"

RUN apk add --no-cache bash=5.0.11-r1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
        ca-certificates=20191127-r1 \
        gettext=0.20.1-r2 \
        git=2.24.1-r0 \
        openssh-client=8.1_p1-r0 \
        openssl=1.1.1d-r3

RUN mkdir -p ~/.ssh

RUN { \
    echo "Host *"; \
    echo "    StrictHostKeyChecking no"; \
} > ~/.ssh/config

RUN chmod -R u=rwX,g=,o= /root/.ssh

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
