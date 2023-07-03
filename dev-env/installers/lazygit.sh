#!/usr/bin/env bash
set -euxo pipefail

VERSION=v0.38.2
URL=https://github.com/jesseduffield/lazygit/releases/download/$VERSION

wget -q $URL/lazygit_0.38.2_Linux_x86_64.tar.gz
wget -q $URL/checksums.txt
sha256sum --check --ignore-missing <checksums.txt
tar -C /usr/local/bin -xzf lazygit_0.38.2_Linux_x86_64.tar.gz lazygit
rm checksums.txt lazygit_0.38.2_Linux_x86_64.tar.gz
