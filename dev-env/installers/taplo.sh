#!/usr/bin/env bash
set -euxo pipefail

VERSION=0.8.0
URL=https://github.com/tamasfe/taplo/releases/download/${VERSION}/taplo-full-linux-x86_64.gz

wget -q $URL
gunzip taplo-full-linux-x86_64.gz
mv taplo-full-linux-x86_64 /usr/local/bin/taplo
chmod +x /usr/local/bin/taplo
