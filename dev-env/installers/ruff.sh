#!/usr/bin/env bash
set -euxo pipefail

VERSION=v0.0.270
URL=https://github.com/charliermarsh/ruff/releases/download/$VERSION

wget -q $URL/ruff-x86_64-unknown-linux-gnu.tar.gz
wget -q $URL/ruff-x86_64-unknown-linux-gnu.tar.gz.sha256
sha256sum --check --ignore-missing <ruff-x86_64-unknown-linux-gnu.tar.gz.sha256
tar -xzvf ruff-x86_64-unknown-linux-gnu.tar.gz ruff
install -m 755 ruff /usr/local/bin/ruff
rm ruff-x86_64-unknown-linux-gnu.tar.gz.sha256 ruff-x86_64-unknown-linux-gnu.tar.gz
