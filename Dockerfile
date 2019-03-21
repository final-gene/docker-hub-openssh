FROM alpine:3.9

LABEL maintainer="frank.giesecke@final-gene.de"

RUN apk add --no-cache bash=4.4.19-r1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
        ca-certificates=20190108-r0 \
        gettext=0.19.8.1-r4 \
        git=2.20.1-r0 \
        openssh-client=7.9_p1-r4 \
        openssl=1.1.1b-r1

RUN mkdir -p ~/.ssh

RUN { \
    echo "Host *"; \
    echo "    StrictHostKeyChecking no"; \
} > ~/.ssh/config

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
