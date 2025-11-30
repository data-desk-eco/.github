FROM node:22-slim
RUN corepack enable && \
    apt-get update && apt-get install -y --no-install-recommends curl git make unzip ca-certificates python3 jq && \
    curl -fsSL -o /tmp/duckdb.zip https://github.com/duckdb/duckdb/releases/download/v1.4.2/duckdb_cli-linux-amd64.zip && \
    unzip -q /tmp/duckdb.zip -d /usr/local/bin && rm /tmp/duckdb.zip && \
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" > /etc/apt/sources.list.d/github-cli.list && \
    apt-get update && apt-get install -y --no-install-recommends gh && \
    apt-get remove -y unzip && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* && \
    useradd -m runner
USER runner
