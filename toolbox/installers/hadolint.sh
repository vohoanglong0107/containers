#!/usr/bin/env bash
set -euxo pipefail

VERSION=v2.12.0
URL=https://github.com/hadolint/hadolint/releases/download/$VERSION

wget -q $URL/hadolint-Linux-x86_64
wget -q $URL/hadolint-Linux-x86_64.sha256
sha256sum --check --ignore-missing <hadolint-Linux-x86_64.sha256
mv hadolint-Linux-x86_64 /usr/local/bin/hadolint
chmod +x /usr/local/bin/hadolint
rm hadolint-Linux-x86_64.sha256
