# Adapted based on https://github.com/microsoft/playwright/blob/main/utils/docker/Dockerfile.noble
FROM oven/bun:1.2.13

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Europe/Berlin

ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN bunx playwright@v1.52.0 install --with-deps