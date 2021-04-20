# OpenSSH & OpenSSL

[![CircleCI](https://circleci.com/gh/final-gene/docker-hub-openssh/tree/master.svg?style=svg)](https://circleci.com/gh/final-gene/docker-hub-openssh/tree/master) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/97b6d0ee6e964d409a0471e789996fa2)](https://www.codacy.com/app/final-gene/docker-hub-openssh?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=final-gene/docker-hub-openssh&amp;utm_campaign=Badge_Grade)

Docker image based on alpine linux with installed openssh client and
openssl tools.

Strict host key checking is disabled.

You can use environment variable `SSH_DEPLOY_KEY` for your private key.
It will create ssh agent with your ssh key.

To avoid the usage of the ssh agent set the variable `DISABLE_AGENT` to `1`

## How to use this image

Run the `openssh` image:

```bash
docker run \
    --rm \
    --env SSH_DEPLOY_KEY=<YOUR-PRIVATE-KEY>
    --volume "$(pwd)":/app \
    finalgene/openssh \
    <COMMAND-TO-RUN>
```

For further information about openssl take a look at the [man page](https://linux.die.net/man/1/openssl).

For further information about openssh take a look at the man pages:  

-   [ssh](https://linux.die.net/man/1/ssh)
-   [ssh-keygen](https://linux.die.net/man/1/ssh-keygen)
-   [scp](https://linux.die.net/man/1/scp)

## Quick reference

-   **Where to get help:**
[the Docker Community Forums](https://forums.docker.com),
[the Docker Community Slack](https://blog.docker.com/2016/11/introducing-docker-community-directory-docker-community-slack),
or [Stack Overflow](https://stackoverflow.com/search?tab=newest&q=docker)

-   **Where to file issues:**
[Issue Tracker](https://github.com/finalgene/docker-hub-openssh/issues)

-   **Maintained by:**
[The final gene Team](https://github.com/finalgene)

-   **Source of this description:**
[Repository README.md](https://github.com/finalgene/docker-hub-openssh/blob/master/README.md)
