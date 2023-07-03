#!/usr/bin/env bash
set -euxo pipefail

VERSION=v0.14.0
URL=https://github.com/google/go-containerregistry/releases/download/$VERSION

wget -q $URL/go-containerregistry_Linux_x86_64.tar.gz
wget -q $URL/checksums.txt
sha256sum --check --ignore-missing <checksums.txt
tar -C /usr/local/bin -xzf go-containerregistry_Linux_x86_64.tar.gz crane gcrane
rm go-containerregistry_Linux_x86_64.tar.gz checksums.txt
