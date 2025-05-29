FROM oven/bun:1.2.15

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Europe/Berlin

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# add node as a runtime as a fix to have the capability to run vitest and install it with npx
# if supported we would only need to run:
# bunx playwright@v1.52.0 install --with-deps
# https://github.com/oven-sh/bun/issues/4145
ENV NODE_VERSION=23
ENV NVM_DIR=/usr/local/nvm
RUN apt-get update -y && \
    apt-get install -y curl && \
    mkdir -p ${NVM_DIR} && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    apt-get -y autoclean

RUN . $NVM_DIR/nvm.sh && \
    nvm install ${NODE_VERSION} && \
    npx playwright@v1.52.0 install --with-deps