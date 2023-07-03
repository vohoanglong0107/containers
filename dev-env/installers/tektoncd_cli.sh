#!/usr/bin/env bash
set -euxo pipefail

VERSION=0.30.0
URL=https://github.com/tektoncd/cli/releases/download/v${VERSION}

wget -q ${URL}/tektoncd-cli-${VERSION}_Linux-64bit.rpm
wget -q ${URL}/checksums.txt
sha256sum --check --ignore-missing <checksums.txt
dnf -y install tektoncd-cli-${VERSION}_Linux-64bit.rpm
rm checksums.txt tektoncd-cli-${VERSION}_Linux-64bit.rpm
dnf clean all
