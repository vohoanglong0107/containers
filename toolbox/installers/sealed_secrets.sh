#!/usr/bin/env bash
set -euxo pipefail

VERSION=0.20.2

wget -q https://github.com/bitnami-labs/sealed-secrets/releases/download/v${VERSION}/kubeseal-${VERSION}-linux-amd64.tar.gz
tar -xvzf kubeseal-${VERSION}-linux-amd64.tar.gz kubeseal
install -m 755 kubeseal /usr/local/bin/kubeseal
rm kubeseal kubeseal-${VERSION}-linux-amd64.tar.gz
