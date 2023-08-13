#!/usr/bin/env bash
set -euxo pipefail

go install github.com/sigstore/cosign/v2/cmd/cosign@v2.1.1
go install golang.org/x/tools/gopls@v0.12.4