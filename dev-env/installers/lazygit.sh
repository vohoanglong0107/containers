#!/usr/bin/env bash
set -euxo pipefail

VERSION=0.40.2
URL=https://github.com/jesseduffield/lazygit/releases/download/v$VERSION

wget -q $URL/lazygit_${VERSION}_Linux_x86_64.tar.gz
wget -q $URL/checksums.txt
sha256sum --check --ignore-missing <checksums.txt
tar -C /usr/local/bin -xzf lazygit_${VERSION}_Linux_x86_64.tar.gz lazygit
rm checksums.txt lazygit_${VERSION}_Linux_x86_64.tar.gz
