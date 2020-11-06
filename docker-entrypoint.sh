#!/bin/sh

if [ ! -z "${SSH_DEPLOY_KEY}" ]; then
    if [ -z "${DISABLE_AGENT}" ]; then
        eval $(ssh-agent -s)
        echo "${SSH_DEPLOY_KEY}" | ssh-add -
    else
        echo "${SSH_DEPLOY_KEY}" > /root/.ssh/id_rsa
        chmod 0600 /root/.ssh/id_rsa
    fi
fi

exec "$@; rm -f /root/.ssh/id_rsa"
