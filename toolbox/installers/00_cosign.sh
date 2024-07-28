#!/usr/bin/env bash
set -euxo pipefail

VERSION=2.3.0
URL=https://github.com/sigstore/cosign/releases/download/v$VERSION

wget -q $URL/cosign-linux-amd64
mv cosign-linux-amd64 /usr/local/bin/cosign
chmod +x /usr/local/bin/cosign
