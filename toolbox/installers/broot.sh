#!/usr/bin/env bash
set -euxo pipefail

VERSION=1.23.0

wget -qO broot.zip https://github.com/Canop/broot/releases/download/v${VERSION}/broot_${VERSION}.zip
unzip -j broot.zip x86_64-linux/broot
mv broot /usr/local/bin/broot
chmod +x /usr/local/bin/broot
