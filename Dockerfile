# Inspired by https://stephenhaney.com/2024/playwright-on-fly-io-with-bun/ even thogh its basically only adding the installation of bun
# Use the official playwright docker image
FROM mcr.microsoft.com/playwright:v1.52.0

# Install unzip and curl (required by bun)
RUN apt-get update && apt-get install -y \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install bun
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH=$PATH:/root/.bun/bin
