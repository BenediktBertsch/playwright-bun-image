# Adapted based on https://github.com/microsoft/playwright/blob/main/utils/docker/Dockerfile.noble
FROM ubuntu:noble

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Europe/Berlin

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install bun with its dependencies
RUN apt-get update && \
    # Install Node.js
    apt-get install -y curl unzip && \
    curl -fsSL https://bun.sh/install | bash && \
    # Feature-parity with node.js base images.
    apt-get install -y --no-install-recommends git openssh-client && \
    # clean apt cache
    rm -rf /var/lib/apt/lists/* && \
    # Create the pwuser
    adduser pwuser

ENV PATH=$PATH:/root/.bun/bin

# Install playwright and its dependencies

ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

RUN bunx playwright install --with-deps