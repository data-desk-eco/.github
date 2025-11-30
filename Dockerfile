FROM node:22-slim
RUN corepack enable && \
    apt-get update && apt-get install -y --no-install-recommends curl git make unzip ca-certificates && \
    curl -fsSL -o /tmp/duckdb.zip https://github.com/duckdb/duckdb/releases/download/v1.4.2/duckdb_cli-linux-amd64.zip && \
    unzip -q /tmp/duckdb.zip -d /usr/local/bin && rm /tmp/duckdb.zip && \
    apt-get remove -y unzip && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
