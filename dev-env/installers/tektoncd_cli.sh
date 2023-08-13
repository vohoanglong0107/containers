#!/usr/bin/env bash
set -euxo pipefail

VERSION=0.30.0
URL=https://github.com/tektoncd/cli/releases/download/v${VERSION}

wget -q ${URL}/tkn_${VERSION}_Linux_x86_64.tar.gz 
wget -q ${URL}/checksums.txt
sha256sum --check --ignore-missing <checksums.txt
tar -C /usr/local/bin/ -xzvf tkn_${VERSION}_Linux_x86_64.tar.gz tkn
chmod +x /usr/local/bin/tkn
rm checksums.txt tkn_${VERSION}_Linux_x86_64.tar.gz 
