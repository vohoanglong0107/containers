#!/usr/bin/env bash
set -euxo pipefail

VERSION=v2.6.6
URL=https://github.com/argoproj/argo-cd/releases/download/$VERSION

wget -qO argocd $URL/argocd-linux-amd64
install -m 555 argocd /usr/local/bin/argocd
rm argocd
