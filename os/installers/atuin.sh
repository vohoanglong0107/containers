#!/usr/bin/env bash
set -euxo pipefail

VERSION=v18.3.0
FORMAT=x86_64-unknown-linux-gnu

wget -q https://github.com/atuinsh/atuin/releases/download/$VERSION/atuin-$FORMAT.tar.gz
wget -q https://github.com/atuinsh/atuin/releases/download/$VERSION/atuin-$FORMAT.tar.gz.sha256

sha256sum --check atuin-$FORMAT.tar.gz.sha256

tar -xzf atuin-$FORMAT.tar.gz
mv atuin-$FORMAT/atuin /usr/bin

rm -rf atuin-$FORMAT atuin-$FORMAT.tar.gz atuin-$FORMAT.tar.gz.sha256
