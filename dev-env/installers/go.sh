#!/usr/bin/env bash
set -euxo pipefail

VERSION=1.20

wget -q https://go.dev/dl/go${VERSION}.linux-amd64.tar.gz
tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz
rm go${VERSION}.linux-amd64.tar.gz
