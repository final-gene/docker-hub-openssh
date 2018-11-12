#!/bin/sh

if [ ! -z "${SSH_DEPLOY_KEY}" ]; then
    eval $(ssh-agent -s)
    echo "${SSH_DEPLOY_KEY}" | ssh-add -
fi

exec "$@"
