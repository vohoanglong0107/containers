#!/usr/bin/env bash
set -euxo pipefail

VERSION=v1.28.4

wget -q https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl
wget -q https://dl.k8s.io/$VERSION/bin/linux/amd64/kubectl.sha256
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl kubectl.sha256
