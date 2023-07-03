#!/usr/bin/env bash
set -euxo pipefail

VERSION=v6.1.2

wget -q https://github.com/bazelbuild/buildtools/releases/download/$VERSION/buildifier-linux-amd64
mv buildifier-linux-amd64 /usr/local/bin/buildifier
chmod +x /usr/local/bin/buildifier
